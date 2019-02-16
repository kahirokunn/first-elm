import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
type alias Age = Maybe Int

type alias User = { name: String, age: Age }

type alias Model = { user : User }


init : Model
init =
  Model { name = "", age = Nothing }

-- UPDATE

toAge : String -> Age
toAge age = String.toInt age

ageToString : Age -> String
ageToString age = case age of
    Just num ->
      String.fromInt num
    Nothing ->
      ""


type Msg
  = InputName String
  | InputAge String

update : Msg -> Model -> Model
update msg model =
  case msg of
    InputName name ->
      { user = { name = name, age = model.user.age } }

    InputAge age ->
      { user = { name = model.user.name, age = toAge age } }



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Name" model.user.name InputName
    , viewInput "text" "Age" (ageToString model.user.age) InputAge
    ]


viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


fizzBuzz : Int -> String
fizzBuzz count =
  case (modBy 3 count, modBy 5 count) of
      (0, 0) ->
        "FizzBuzz"
      (0, _) ->
        "Fizz"
      (_, 0) ->
        "Buzz"
      (_, _) ->
        String.fromInt count


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
type alias Model = { result: List String }


init : Model
init = { result = [] }


-- UPDATE


type Msg
  = InputNumber String

update : Msg -> Model -> Model
update msg model =
  case msg of
    InputNumber maybeNum ->
      case (String.toInt maybeNum) of
          Just num ->
            { result = List.map fizzBuzz (List.range 1 num) }
          Nothing ->
              { result = [] }

-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ viewInput "text" "Number" InputNumber
    , div []
        [
          ul []
            (List.map (\r -> li [] [text r]) model.result)
        ]
    ]


viewInput : String -> String -> (String -> msg) -> Html msg
viewInput t p toMsg =
  input [ type_ t, placeholder p, onInput toMsg ] []

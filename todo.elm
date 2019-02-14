import Browser
import Html exposing (Html, Attribute, div, input, ul, li, text, button, form)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onSubmit)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
  { items: List String,
    current: String
  }


init : Model
init = { items = [], current = "" }

-- UPDATE

type Msg = Input String | AddTask


update : Msg -> Model -> Model
update msg model =
  case msg of
    Input newValue ->
      { items = model.items,
        current = newValue
      }
    AddTask ->
      { items = model.items ++ [model.current],
        current = ""
      }



-- VIEW


view : Model -> Html Msg
view model =
  Html.form [ onSubmit AddTask ]
    [
      input [ placeholder "Input your task", value model.current, onInput Input ] []
    , button [ Html.Attributes.type_ "submit" ] [ text "submit"]
    , ul [] (List.map (\l -> li [] [ text l ]) model.items)
    ]

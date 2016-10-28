module Query exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { query : String
    }


initModel : Model
initModel =
    { query = ""
    }


type Msg
    = QueryInput String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        QueryInput query ->
            { model | query = query }

        Submit ->
            model


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Query Page" ]
        , input [ onInput QueryInput, placeholder "query...", value model.query ] []
        , button [ onClick Submit ] [ text "Submit" ]
        ]

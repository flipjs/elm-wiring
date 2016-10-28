module Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { username : String
    , password : String
    }


initModel : Model
initModel =
    { username = ""
    , password = ""
    }


type Msg
    = UsernameInput String
    | PasswordInput String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        UsernameInput username ->
            { model | username = username }

        PasswordInput password ->
            { model | password = password }

        Submit ->
            model


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Login Page" ]
        , input [ onInput UsernameInput, placeholder "username...", value model.username ] []
        , input [ onInput PasswordInput, placeholder "password...", value model.password ] []
        , button [ onClick Submit ] [ text "Submit" ]
        ]

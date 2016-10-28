module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Html.App as App
import Login
import Query


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }


type alias Model =
    { page : Page
    , login : Login.Model
    , query : Query.Model
    }


initModel : Model
initModel =
    { page = LoginPage
    , login = Login.initModel
    , query = Query.initModel
    }


type Page
    = LoginPage
    | QueryPage


type Msg
    = ChangePage Page
    | LoginMsg Login.Msg
    | QueryMsg Query.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model | page = page }

        LoginMsg loginMsg ->
            { model
                | login = Login.update loginMsg model.login
            }

        QueryMsg queryMsg ->
            { model
                | query = Query.update queryMsg model.query
            }


view : Model -> Html Msg
view model =
    let
        pageView =
            case model.page of
                LoginPage ->
                    App.map LoginMsg (Login.view model.login)

                QueryPage ->
                    App.map QueryMsg (Query.view model.query)
    in
        div []
            [ div []
                [ a [ href "#", onClick <| ChangePage LoginPage ] [ text "Login Page" ]
                , text " | "
                , a [ href "#", onClick <| ChangePage QueryPage ] [ text "Query Page" ]
                ]
            , hr [] []
            , pageView
            , hr [] []
            , text <| toString model
            ]

module App.View exposing (view)

import App.Types exposing (..)
import Browser exposing (Document)
import Html
import Page.Main.View
import Page.SignIn.View


view : Model -> Document Msg
view model =
    { title = "My Title"
    , body =
        [ Html.p [] [ Html.text "Header :: Hello o/" ]
        , Html.div [] <|
            case model.page of
                MainPage ->
                    Page.Main.View.view model

                SignInPage _ ->
                    Page.SignIn.View.view model

                NotFound ->
                    [ Html.div [] [ Html.text "404 - Not Found" ] ]
        , Html.div [] [ routeToString model.page |> Html.text ]
        ]
    }

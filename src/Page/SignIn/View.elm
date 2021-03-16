module Page.SignIn.View exposing (view)

import App.Types exposing (..)
import Html
import Html.Attributes
import Lib.OAuth


view : Model -> List (Html.Html Msg)
view model =
    [ Html.a [ Html.Attributes.href "/" ] [ Html.text "Main Page" ]
    , Html.div []
        [ case model.page of
            SignInPage (SignInCallback _) ->
                Html.div [] [ Html.text "Noice" ]

            _ ->
                Html.a [ Html.Attributes.href Lib.OAuth.authorizeURL ] [ Html.text "Sign in with Gitea" ]
        ]
    ]

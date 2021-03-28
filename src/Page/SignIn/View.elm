module Page.SignIn.View exposing (..)


import Html
import Html.Attributes
import App.Model
import App.Message
import Page.SignIn.Route exposing (..)
import Lib.Gitea


view : Route -> App.Model.Model -> List (Html.Html App.Message.Message)
view page model =
    [ Html.div []
        [ case page of
            Callback (Just code) -> Html.div [] [ Html.text <| "Noice: " ++ code ]
            _ -> Html.a [ Html.Attributes.href (Lib.Gitea.authorizeURL model.signIn.gitea) ] [ Html.text "Sign in with Gitea" ]
        ]
    ]


-- import App.Types exposing (..)
-- import Html
-- import Html.Attributes
-- import Lib.Gitea


-- view : Model -> List (Html.Html Msg)
-- view model =
--     [ Html.a [ Html.Attributes.href "/" ] [ Html.text "Main Page" ]
--     , Html.div []
--         [ case model.page of
--             SignInPage (SignInCallback _) ->
--                 Html.div [] [ Html.text "Noice" ]

--             _ ->
--                 Html.a [ Html.Attributes.href Lib.Gitea.authorizeURL ] [ Html.text "Sign in with Gitea" ]
--         ]
--     ]

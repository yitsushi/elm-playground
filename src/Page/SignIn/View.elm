module Page.SignIn.View exposing (view)

import Browser exposing (Document)
import Html
import Html.Events exposing (onClick)
import Html.Attributes

import App.Types exposing (..)
import Lib.OAuth exposing (maybeTokenToString)

view : Model -> List (Html.Html Msg)
view model =
  [ Html.a [ Html.Attributes.href "/" ] [ Html.text "Main Page" ]
  , Html.div []
      [
        case model.page of
          SignInPage (SignInCallback _) -> Html.div [ ] [ Html.text "Noice" ]
          _ -> Html.a [ Html.Attributes.href Lib.OAuth.authorizeURL ] [ Html.text "Sign in with Gitea" ]
      ]
  ]
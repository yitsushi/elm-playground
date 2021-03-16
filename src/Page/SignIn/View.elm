module Page.SignIn.View exposing (view)

import Browser exposing (Document)
import Html
import Html.Events exposing (onClick)
import Html.Attributes

import App.Types exposing (..)

view : Model -> List (Html.Html Msg)
view model =
  [ Html.a [ Html.Attributes.href "/" ] [ Html.text "Main Page" ]
  , Html.div [] [ Html.text <| maybeTokenToString model.token ]
  ]
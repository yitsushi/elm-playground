module Page.Main.View exposing (view)

import Browser exposing (Document)
import Html
import Html.Events exposing (onClick)
import Html.Attributes

import App.Types exposing (..)
import Lib.OAuth exposing (maybeTokenToString)

view : Model -> List (Html.Html Msg)
view model =
  [ Html.a [ Html.Attributes.href "/signin/" ] [ Html.text "SignIn" ]
  ]
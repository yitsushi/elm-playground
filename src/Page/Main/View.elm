module Page.Main.View exposing (view)

import App.Types exposing (..)
import Browser exposing (Document)
import Html
import Html.Attributes
import Html.Events exposing (onClick)
import Lib.OAuth exposing (maybeTokenToString)


view : Model -> List (Html.Html Msg)
view model =
    [ Html.a [ Html.Attributes.href "/signin/" ] [ Html.text "SignIn" ]
    ]

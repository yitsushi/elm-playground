module Page.Main.View exposing (view)

import App.Types exposing (..)
import Html
import Html.Attributes


view : Model -> List (Html.Html Msg)
view _ =
    [ Html.a [ Html.Attributes.href "/signin/" ] [ Html.text "SignIn" ]
    ]

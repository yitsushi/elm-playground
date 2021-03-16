module Page.Main.View exposing (view)

import App.Types exposing (..)
import Html
import Html.Attributes


view : Model -> List (Html.Html Msg)
view _ =
    [ Html.div [] [ Html.a [ Html.Attributes.href "/signin/" ] [ Html.text "SignIn" ] ]
    , Html.div [] [ Html.a [ Html.Attributes.href "/aoc/1" ] [ Html.text "Day#01" ] ]
    ]

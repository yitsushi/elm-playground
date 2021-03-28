module Page.Main.View exposing (view)

import Html
import Html.Attributes
import App.Model
import App.Message
import Page.Main.Route


view : Page.Main.Route.Route -> App.Model.Model -> List (Html.Html App.Message.Message)
view _ _ =
    [ Html.div [] [ Html.a [ Html.Attributes.href "/signin/" ] [ Html.text "SignIn" ] ]
    , Html.div [] [ Html.a [ Html.Attributes.href "/aoc/1" ] [ Html.text "Day#01" ] ]
    ]

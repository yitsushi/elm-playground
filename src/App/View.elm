module App.View exposing (view)

-- import Page.AoC.View
-- import Page.Main.View
-- import Page.SignIn.View

import App.Message as Message
import App.Model as Model
import App.Route
import Browser exposing (Document)
import Global.View
import Html
import Html.Attributes
import Page.Main.View
import Page.AoC.View
import Page.SignIn.View


view : Model.Model -> Document Message.Message
view model =
    { title = "My Title"
    , body =
        [ Html.a [ Html.Attributes.href "/" ] [ Html.text "Main Page" ]
        , Html.div [] [ Html.text "Header :: Hello o/" ]
        , Html.div
            [ Html.Attributes.class "content" ]
            (case model.global.page of
                App.Route.Global page ->
                    Global.View.view page model

                App.Route.MainPage page ->
                    Page.Main.View.view page model

                App.Route.AdventOfCode page ->
                    Page.AoC.View.view page model
                
                App.Route.SignIn page ->
                    Page.SignIn.View.view page model
            )
        ]
    }



-- { title = "My Title"
-- , body =
--     [ Html.div [] [ Html.text "Header :: Hello o/" ]
--     , Html.div [] <|
--         case model.global.page of
--             MainPage ->
--                 Page.Main.View.view model
--             SignInPage _ ->
--                 Page.SignIn.View.view model
--             NotFound ->
--                 [ Html.div [] [ Html.text "404 - Not Found" ] ]
--             AdventOfCode2020 day ->
--                 Page.AoC.View.view model day
--     , Html.div [] [ routeToString model.page |> Html.text ]
--     ]
-- }

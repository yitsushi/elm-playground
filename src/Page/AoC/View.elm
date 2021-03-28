module Page.AoC.View exposing (view)

import Html
import Html.Attributes
import App.Model
import App.Message
import Page.AoC.Route exposing (..)


view : Route -> App.Model.Model -> List (Html.Html App.Message.Message)
view page _ =
    [ Html.nav [] <| List.map dayToLink (List.range 1 25)
    , Html.div []
        (case page of
            Root ->
                [ ]
            Solution day ->
                [ Html.div [] [ Html.text <| "Solution for: Day " ++ String.fromInt day ]
                ]
        )
    ]


-- view : Model -> String -> List (Html.Html Msg)
-- view model day =
--     let
--         ( part1, part2 ) =
--             model.adventOfCodeOutput
        
--         puzzleList = List.map dayToLink (List.range 1 25)
--         extra = case day of
--             "-" -> []
--             _ -> [ Html.h1 [] [ Html.text <| "Day #" ++ day ]
--                  , Html.h2 [] [ Html.text "Part#1" ]
--                  , Html.pre [] [ Html.text <| Maybe.withDefault "No solution" part1 ]
--                  , Html.h2 [] [ Html.text "Part#2" ]
--                  , Html.pre [] [ Html.text <| Maybe.withDefault "No solution" part2 ]
--                  ]
--     in
--         [ Html.div [] puzzleList
--         , Html.div [] [ Html.text "Calculating the solution is a blocking operation because I'm lazy AF" ]
--         ] ++ extra

dayToLink : Int -> Html.Html App.Message.Message
dayToLink x = 
    let
        stringValue = String.fromInt x
    in
        Html.a [ Html.Attributes.href ("/aoc/" ++ stringValue) ] [ Html.text stringValue]
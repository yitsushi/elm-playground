module Page.AoC.Update exposing (..)

import App.Message as Base
import Page.AoC.Model exposing (Model)

update : Base.Message -> Model -> ( Model, Cmd Base.Message )
update _ model =
    ( model, Cmd.none )


-- update : Msg -> Model -> String -> ( Model, Cmd Msg )
-- update msg model target =
--     let
--         input =
--             case msg of
--                 AdventOfCodeInputLanded inp ->
--                     Just inp

--                 _ ->
--                     Nothing

--         ( output, command ) =
--             case input of
--                 Just inp ->
--                     case inp of
--                         Ok text ->
--                             ( selectSolver target text, Cmd.none )

--                         Err _ ->
--                             ( ( Just "HTTP Error...", Just "HTTP Error..." ), Cmd.none )
--                 Nothing ->
--                     case target of
--                         "-" -> ( (Nothing, Nothing), Cmd.none )
--                         _ -> ( (Just "Working on it", Just "Working on it"), requestInput target )
--     in
--     ( { model | adventOfCodeOutput = output }, command )


-- requestInput : String -> Cmd Msg
-- requestInput day =
--     Http.get
--         { url = "/input/" ++ day
--         , expect = Http.expectString AdventOfCodeInputLanded
--         }


-- selectSolver : String -> (String -> ( Maybe String, Maybe String ))
-- selectSolver day =
--     case day of
--         "1" ->
--             AoC.Day01.solve

--         _ ->
--             \c -> ( Nothing, Nothing )

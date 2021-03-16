module AoC.Day01 exposing (..)

import Result


solve : String -> ( Maybe String, Maybe String )
solve input =
    let
        parsed =
            parse input
    in
    ( part1 parsed, part2 parsed )


part1 : List Int -> Maybe String
part1 input =
    pairs input
        |> List.filter (\( x, y ) -> x + y == 2020)
        |> List.map (\( x, y ) -> x * y)
        |> List.head
        |> Maybe.map String.fromInt


part2 : List Int -> Maybe String
part2 input =
    triplets input
        |> List.filter (\( x, y, z ) -> x + y + z == 2020)
        |> List.map (\( x, y, z ) -> x * y * z)
        |> List.head
        |> Maybe.map String.fromInt


parse : String -> List Int
parse input =
    List.map (\x -> String.toInt x |> Maybe.withDefault 0) <| String.split "\n" input


pairs : List Int -> List ( Int, Int )
pairs input =
    case input of
        [] ->
            []

        x :: xs ->
            List.map (Tuple.pair x) xs ++ pairs xs

triplets : List Int -> List ( Int, Int, Int )
triplets input =
    case input of
        [] ->
            []

        x :: xs ->
            (pairs xs |> List.map (\(y, z) -> (x, y ,z))) ++ triplets xs
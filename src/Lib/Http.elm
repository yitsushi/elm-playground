module Lib.Http exposing (..)

type alias URLParameter =
    { key : String
    , value : String
    }

paramsToString : List URLParameter -> String
paramsToString params =
    List.map (\param -> param.key ++ "=" ++ param.value) params |> String.join "&"

module Global.Route exposing (..)


type Route
    = NotFound
    | SomethingWentWrong ( Int, String )

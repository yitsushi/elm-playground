port module App.Main exposing (main)

import App.Init exposing (init)
import App.Route exposing (onUrlChange, onUrlRequest)
import App.Types exposing (..)
import App.Update exposing (update)
import App.View exposing (view)
import Browser


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        }


port sendTokenToStorage : String -> Cmd msg

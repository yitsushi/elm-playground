module App.Init exposing (..)

import App.Ports exposing (sendTokenToStorage)
import App.Route exposing (parsedUrl)
import App.Types exposing (..)
import App.Update
import Browser.Navigation exposing (Key)
import Lib.OAuth exposing (Token(..))
import Url exposing (Url)


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    App.Update.update NoOp
        { navigationKey = key
        , page = App.Route.parsedUrl url
        }

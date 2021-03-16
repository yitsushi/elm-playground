module App.Init exposing (..)

import Browser.Navigation exposing (Key)
import Url exposing (Url)

import App.Ports exposing (sendTokenToStorage)
import App.Route exposing (parsedUrl)
import App.Types exposing (..)
import App.Update

init : Flags -> Url -> Key -> (Model, Cmd Msg)
init flags url key =
  App.Update.update NoOp
    { token = Maybe.map (Token) flags.storedToken
    , navigationKey = key
    , page = App.Route.parsedUrl url
    }

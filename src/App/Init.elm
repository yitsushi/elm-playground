module App.Init exposing (..)

import Browser.Navigation exposing (Key)
import Url exposing (Url)

import App.Ports exposing (sendTokenToStorage)
import App.Route exposing (parsedUrl)
import App.Types exposing (..)

init : Flags -> Url -> Key -> (Model, Cmd Msg)
init flags url key =
  let
    token = case parsedUrl url of
              App.Route.Signin githubToken -> Just (Token githubToken)
              _ ->
                Maybe.map (Token) flags.storedToken
    newModel = { token = token
               , navigationKey = key
               }

    commands = case token of 
      Just (Token tok) -> sendTokenToStorage tok
      Nothing -> Cmd.none
    _ = Debug.log "newModel" newModel
    _ = Debug.log "flags" flags
  in (newModel, commands)

module Page.SignIn.Update exposing (..)

import App.Types exposing (Model, Msg(..), Token ( .. ))
import Browser.Navigation as Navigation

import App.Ports exposing (sendTokenToStorage)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    token = case model.page of
      App.Types.SignInPage tok -> Just (Token tok)
      _ -> model.token

    commands = case token of 
      Just (Token tok) -> sendTokenToStorage tok
      Nothing -> Cmd.none
  in
    ( { model | token = token }, commands )
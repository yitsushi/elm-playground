module Page.SignIn.Update exposing (..)

import App.Ports exposing (sendTokenToStorage)
import App.Types exposing (Model, Msg(..))
import Browser.Navigation as Navigation
import Lib.OAuth exposing (Token(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        token =
            case model.page of
                App.Types.SignInPage (App.Types.SignInCallback (Just tok)) ->
                    Just (Code tok)

                _ ->
                    Nothing

        commands =
            case token of
                Just (Code tok) ->
                    Lib.OAuth.requestAccessToken AccessTokenLanded tok

                _ ->
                    Cmd.none
    in
    ( model, commands )

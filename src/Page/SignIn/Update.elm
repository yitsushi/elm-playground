module Page.SignIn.Update exposing (..)

import App.Message as Base
import Page.SignIn.Model exposing (Model)


update : Base.Message -> Model -> ( Model, Cmd Base.Message )
update _ model =
    ( model, Cmd.none )



-- import App.Types exposing (Model, Msg(..))
-- import Lib.OAuth exposing (Token(..))


-- update : Msg -> Model -> ( Model, Cmd Msg )
-- update _ model =
--     let
--         token =
--             case model.page of
--                 App.Types.SignInPage (App.Types.SignInCallback (Just tok)) ->
--                     Just (Code tok)

--                 _ ->
--                     Nothing

--         commands =
--             case token of
--                 Just (Code tok) ->
--                     Lib.OAuth.requestAccessToken AccessTokenLanded tok

--                 _ ->
--                     Cmd.none
--     in
--     ( model, commands )

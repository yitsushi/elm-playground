module App.Update exposing (update)

import App.Message as Message
import App.Model as Model
import Global.Update
import Page.Main.Update
import Page.SignIn.Update


update : Message.Message -> Model.Model -> ( Model.Model, Cmd Message.Message )
update msg model =
    let
        ( globalModel, globalCmd ) =
            Global.Update.update msg model.global

        ( mainPageModel, mainPageCmd ) =
            Page.Main.Update.update msg model.mainPage
        
        ( signInModel, signInCmd ) =
            Page.SignIn.Update.update msg model.signIn

        finalModel =
            { model
                | global = globalModel
                , mainPage = mainPageModel
                , signIn = signInModel
            }

        finalCmds =
            Cmd.batch [ globalCmd, mainPageCmd, signInCmd ]
    in
    ( finalModel, finalCmds )



-- case msg of
--     _ -> ( model, Cmd.none )
-- case model.page of
--     NotFound ->
--         ( model, Cmd.none )
--     MainPage ->
--         Page.Main.Update.update msg model
--     SignInPage _ ->
--         Page.SignIn.Update.update msg model
--     AdventOfCode2020 target ->
--         Page.AoC.Update.update msg model target

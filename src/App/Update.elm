module App.Update exposing (update)

import App.Route
import App.Types exposing (Model, Msg(..), Route(..))
import Browser
import Browser.Navigation as Navigation
import Page.AoC.Update
import Page.Main.Update
import Page.SignIn.Update
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigareTo url ->
            ( model, Navigation.pushUrl model.navigationKey url )

        UrlChanged url ->
            update NoOp { model | page = App.Route.parsedUrl url }

        UrlRequest request ->
            case request of
                Browser.Internal url ->
                    ( model, Navigation.pushUrl model.navigationKey (Url.toString url) )

                Browser.External url ->
                    ( model, Navigation.load url )

        _ ->
            case model.page of
                MainPage ->
                    Page.Main.Update.update msg model

                SignInPage _ ->
                    Page.SignIn.Update.update msg model

                NotFound ->
                    ( model, Cmd.none )

                AdventOfCode2020 target ->
                    Page.AoC.Update.update msg model target

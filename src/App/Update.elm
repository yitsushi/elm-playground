module App.Update exposing (update)

import App.Types exposing (Model, Msg(..), Route (..))
import Browser
import Browser.Navigation as Navigation
import Url

import Page.SignIn.Update
import Page.Main.Update

import App.Route

update : Msg -> Model -> (Model, Cmd Msg)
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
        SignInPage token ->
          Page.SignIn.Update.update msg model
        NotFound ->
          ( model, Cmd.none )
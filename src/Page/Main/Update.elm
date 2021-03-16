module Page.Main.Update exposing (..)

import App.Types exposing (Model, Msg(..))
import Browser.Navigation as Navigation


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )

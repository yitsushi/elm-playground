module Page.Main.Update exposing (..)

import App.Types exposing (Model, Msg(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )

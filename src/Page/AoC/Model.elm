module Page.AoC.Model exposing (..)

type alias Model =
  { output : (Maybe String, Maybe String)
  , error : (Maybe String, Maybe String)
  }

outputOrError : Model -> (String, String)
outputOrError data =
  let
    (out1, out2) = data.output
    (err1, err2) = data.error
    resolve out err = Maybe.withDefault (Maybe.withDefault "Nothing" err) out
  in
    (resolve out1 err1, resolve out2 err2)

initialModel : Model
initialModel =
  { output = (Nothing, Nothing)
  , error = (Nothing, Nothing)
  }
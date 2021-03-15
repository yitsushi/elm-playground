module App.Types exposing
  ( Flags
    , Model
    , Token ( .. )
    , Msg ( .. )
  )

import Browser.Navigation exposing (Key)

type Token = Token String

type alias Model = 
  { token: Maybe Token
  , navigationKey: Key }

type alias Flags =
  { storedToken : Maybe String
  , tmp : String
  }

type Msg = NoOp

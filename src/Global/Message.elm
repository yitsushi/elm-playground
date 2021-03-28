module Global.Message exposing (..)

import Url
import Browser

type Message
  = NavigareTo String
  | UrlChanged Url.Url
  | UrlRequest Browser.UrlRequest
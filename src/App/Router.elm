module App.Router exposing
    ( onUrlChange
    , onUrlRequest
    , parsedUrl
    , routeParser
    )

import Browser exposing (UrlRequest)
-- import Page.AoC.Route
-- import Page.SignIn.Route
import Url exposing (Url)
import Url.Parser as Parser
import App.Route as Route
import App.Message as Message
import Page.Main.Route as PageMain
import Page.AoC.Route as PageAoC
import Page.SignIn.Route as PageSignIn
import Global.Route as GlobalRoute
import Global.Message

routeParser : Parser.Parser (Route.Route -> a) a
routeParser =
    Parser.oneOf <|
        [ transformMainPage PageMain.route
        , transformAdventOfCode PageAoC.route
        , transformSignIn PageSignIn.route
        ]

parsedUrl : Url -> Route.Route
parsedUrl url =
    Maybe.withDefault (Route.Global GlobalRoute.NotFound) (Parser.parse routeParser url)


onUrlRequest : UrlRequest -> Message.Message
onUrlRequest request =
    Message.Global <| Global.Message.UrlRequest request


onUrlChange : Url -> Message.Message
onUrlChange url =
    Message.Global <| Global.Message.UrlChanged url

transformMainPage : Parser.Parser (PageMain.Route -> Route.Route) b -> Parser.Parser (b -> c) c
transformMainPage r = Parser.map Route.MainPage r

transformAdventOfCode : Parser.Parser (PageAoC.Route -> Route.Route) b -> Parser.Parser (b -> c) c
transformAdventOfCode r = Parser.map Route.AdventOfCode r

transformSignIn : Parser.Parser (PageSignIn.Route -> Route.Route) b -> Parser.Parser (b -> c) c
transformSignIn r = Parser.map Route.SignIn r

-- transformRoute : Route.Route -> Parser.Parser (a -> Route.Route) b -> Parser.Parser (b -> c) c
-- transformRoute target r = Parser.map target r
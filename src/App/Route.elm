module App.Route exposing (..)

import Global.Route as Global
import Page.Main.Route as PageMain
import Page.AoC.Route as AoC
import Page.SignIn.Route as SignIn

type Route
    = Global Global.Route
    | MainPage PageMain.Route
    | AdventOfCode AoC.Route
    | SignIn SignIn.Route
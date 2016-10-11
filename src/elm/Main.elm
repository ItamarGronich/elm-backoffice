module Main exposing (..)

import App.View exposing (..)
import App.Update exposing (..)
import Html.App as Html


main : Program Never
main =
    Html.program
        { init = App.Update.init
        , update = App.Update.update
        , view = App.View.view
        , subscriptions = \_ -> Sub.none
        }

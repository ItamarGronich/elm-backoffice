module Main exposing (..)

import DataTable exposing (init, update, view, sales)
import Html.App as Html


main : Program Never
main =
    Html.program
        { init = init sales
        , update = update
        , view = view
        , subscriptions = \_ -> Sub.none
        }

module Menu.View exposing (..)

import Html exposing (nav, text, ul, li, button)
import Html.Events exposing (onClick)
import App.Model exposing (..)
import App.Update exposing (..)


menuItems : List Page
menuItems =
    [ Sales
    , Items
    , Clients
    ]


menu : Html.Html Msg
menu =
    nav []
        [ ul [] (List.map menuItem menuItems) ]


menuItem : Page -> Html.Html Msg
menuItem page =
    li [] [ button [ onClick (SetActivePage page) ] [ text (toString page) ] ]

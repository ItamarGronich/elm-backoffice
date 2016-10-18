module Menu.View exposing (..)

import Html exposing (nav, text, ul, li, button)
import Html.Events exposing (onClick)
import Html.Attributes exposing (classList, class)
import App.Model exposing (..)
import App.Update exposing (..)


menuItems : List Page
menuItems =
    [ Sales
    , Items
    , Clients
    ]


menu : Model -> Html.Html Msg
menu model =
    nav [ class "Menu" ]
        [ ul [] (List.map (menuItem model) menuItems) ]


menuItem : Model -> Page -> Html.Html Msg
menuItem model page =
    li [] [ button [ (isActive model.activePage page), (onClick (SetActivePage page)) ] [ text (toString page) ] ]


isActive : Page -> Page -> Html.Attribute Msg
isActive currentPage item =
    let
        ifActive =
            currentPage == item
    in
        classList
            [ ( "Menu-item", True )
            , ( "isActive", ifActive )
            ]

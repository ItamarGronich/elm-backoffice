module App.Model exposing (..)


type Page
    = Sales
    | Items
    | Clients


type alias Model =
    { activePage : Page }


initialModel : Model
initialModel =
    { activePage = Sales }


encodePage : String -> Page
encodePage text =
    case text of
        "Sales" ->
            Sales

        "Items" ->
            Items

        "Clients" ->
            Clients

        _ ->
            Sales


decodePage : Page -> String
decodePage page =
    case page of
        Sales ->
            "Sales"

        Items ->
            "Items"

        Clients ->
            "Clients"

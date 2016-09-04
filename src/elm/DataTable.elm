module DataTable exposing (..)

import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String
import Table


-- MODEL


type alias Model =
    { sales : List Sale
    , tableState : Table.State
    , query : String
    }


init : List Sale -> ( Model, Cmd Msg )
init sales =
    let
        model =
            { sales = sales
            , tableState = Table.initialSort "ID"
            , query = ""
            }
    in
        ( model, Cmd.none )



-- UPDATE


type Msg
    = SetQuery String
    | SetTableState Table.State


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetQuery newQuery ->
            ( { model | query = newQuery }
            , Cmd.none
            )

        SetTableState newState ->
            ( { model | tableState = newState }
            , Cmd.none
            )



-- VIEW


view : Model -> Html Msg
view { sales, tableState, query } =
    let
        lowerQuery =
            String.toLower query

        acceptableSales =
            List.filter (String.contains lowerQuery << String.toLower << .title) sales
    in
        div []
            [ h1 [] [ text "Sales" ]
            , input [ placeholder "Search by Name", onInput SetQuery ] []
            , Table.view config tableState acceptableSales
            ]


config : Table.Config Sale Msg
config =
    Table.config
        { toId = .saleId >> toString
        , toMsg = SetTableState
        , columns =
            [ Table.intColumn "ID" .saleId
            , Table.stringColumn "Status" (.status >> deconstructStatus)
            , Table.stringColumn "Title" .title
            , Table.stringColumn "Type" (.saleType >> deconstructType)
            , Table.stringColumn "Mail Start" .mailStart
            ]
        }



-- PEOPLE


type alias Sale =
    { saleId : Int
    , status : SaleStatus
    , title : String
    , saleType : SaleType
    , mailStart : String
    }


type SaleStatus
    = SaleNew
    | SaleInProcess
    | SalePublishedOnSite


deconstructStatus : SaleStatus -> String
deconstructStatus status =
    case status of
        SaleNew ->
            "New"

        SaleInProcess ->
            "In Process"

        SalePublishedOnSite ->
            "Published On Site"


type SaleType
    = Mail
    | Live
    | MailAndLive


deconstructType : SaleType -> String
deconstructType status =
    case status of
        Mail ->
            "Mail"

        Live ->
            "Live"

        MailAndLive ->
            "Mail & live"


sales : List Sale
sales =
    [ Sale 1732 SaleNew "Sale 1" Mail "22/10/2013"
    , Sale 1733 SaleInProcess "foo" MailAndLive "22/10/2013"
    ]

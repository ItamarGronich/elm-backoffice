module DataTable exposing (..)

import Html exposing (Html, div, h1, input, text)
import Html.Attributes exposing (placeholder)
import Html.Events exposing (onInput)
import String
import Table
import Date
import Json.Decode exposing (Decoder, int, string, object5, (:=), list)


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
            , Table.stringColumn "Mail Start" (.mailStart >> toDateString)
            ]
        }


toDateString : Date.Date -> String
toDateString date =
    let
        day =
            Date.day date |> toString

        monthToNumber : Date.Month -> String
        monthToNumber stringDate =
            case stringDate of
                Date.Jan ->
                    "01"

                Date.Feb ->
                    "02"

                Date.Mar ->
                    "03"

                Date.Apr ->
                    "04"

                Date.May ->
                    "01"

                Date.Jun ->
                    "02"

                Date.Jul ->
                    "03"

                Date.Aug ->
                    "04"

                Date.Sep ->
                    "09"

                Date.Oct ->
                    "10"

                Date.Nov ->
                    "11"

                Date.Dec ->
                    "12"

        month =
            monthToNumber (Date.month date)

        year =
            Date.year date |> toString
    in
        day ++ "/" ++ month ++ "/" ++ year



-- PEOPLE


type alias Sale =
    { saleId : Int
    , status : SaleStatus
    , title : String
    , saleType : SaleType
    , mailStart : Date.Date
    }


emptySale : Sale
emptySale =
    { saleId = 0
    , status = NullStatus
    , title = ""
    , saleType = NullSaleType
    , mailStart = Date.fromTime 1472715899000
    }


type SaleStatus
    = SaleNew
    | SaleInProcess
    | SalePublishedOnSite
    | NullStatus


deconstructStatus : SaleStatus -> String
deconstructStatus status =
    case status of
        SaleNew ->
            "New"

        SaleInProcess ->
            "In Process"

        SalePublishedOnSite ->
            "Published On Site"

        NullStatus ->
            ""


type SaleType
    = Mail
    | Live
    | MailAndLive
    | NullSaleType


deconstructType : SaleType -> String
deconstructType status =
    case status of
        Mail ->
            "Mail"

        Live ->
            "Live"

        MailAndLive ->
            "Mail & live"

        NullSaleType ->
            ""


sales : List Sale
sales =
    [ Sale 1732 SaleNew "Sale 1" Mail (Date.fromTime 1472715899000)
    , Sale 1733 SaleInProcess "foo" MailAndLive (Date.fromTime 1483725899000)
    ]

module Decode.Sale exposing (..)

import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, int, (:=), andThen)
import Decode.Status exposing (..)


decodeSale : Json.Value -> Sale
decodeSale payload =
    case decodeValue saleDecoder payload of
        Ok sale ->
            sale

        Err message ->
            emptySale


saleDecoder : Decoder Sale
saleDecoder =
    succeed Sale
        |: ("id" := int)
        |: (("value" := string) `andThen` status)


type alias Sale =
    { saleId : Int
    , status :
        SaleStatus
        {- , title : String
           , saleType : SaleType
           , mailStart : Date.Date
        -}
    }


emptySale : Sale
emptySale =
    { saleId = 0
    , status =
        NullStatus
        {- , title = ""
           , saleType = NullSaleType
           , mailStart = Date.fromTime 1472715899000
        -}
    }

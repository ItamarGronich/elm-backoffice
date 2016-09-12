module DecodeSale exposing (..)

import Assets.SalesJson exposing (..)
import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, int, (:=))
import DataTable exposing (..)


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

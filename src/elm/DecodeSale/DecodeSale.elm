module DecodeSale exposing (..)

import Assets.SalesJson exposing (..)
import Json.Encode as Json
import Json.Decode.Extra exposing ((|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, (:=))
import DataTable exposing (..)


decodeSale : Json.Value -> Sale
decodeSale payload =

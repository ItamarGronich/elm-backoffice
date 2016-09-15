module Decode.Type exposing (..)


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

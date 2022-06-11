//
//  CryptoModel.swift
//  CryptoHW
//
//  Created by GLaDOS on 11.06.2022.
//

import Foundation

// MARK: - Crypto
struct Crypto: Codable {
    var id, currency, symbol, name: String
    var logoURL: String
    var status: Status
    var price: String
    var priceDate, priceTimestamp: String
    var circulatingSupply: String
    var maxSupply: String?
    var marketCap, marketCapDominance, numExchanges, numPairs: String
    var numPairsUnmapped: String
    var firstCandle: String
    var firstTrade: String?
    var firstOrderBook: String
    var rank, rankDelta, high: String
    var highTimestamp: String
    var the1D: The1D
    var platformCurrency, firstPricedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, currency, symbol, name
        case logoURL = "logo_url"
        case status, price
        case priceDate = "price_date"
        case priceTimestamp = "price_timestamp"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case numExchanges = "num_exchanges"
        case numPairs = "num_pairs"
        case numPairsUnmapped = "num_pairs_unmapped"
        case firstCandle = "first_candle"
        case firstTrade = "first_trade"
        case firstOrderBook = "first_order_book"
        case rank
        case rankDelta = "rank_delta"
        case high
        case highTimestamp = "high_timestamp"
        case the1D = "1d"
        case platformCurrency = "platform_currency"
        case firstPricedAt = "first_priced_at"
    }
}

enum Status: String, Codable {
    case active = "active"
}

// MARK: - The1D
struct The1D: Codable {
    var volume, priceChange, priceChangePct: String
    var volumeChange, volumeChangePct: String?
    var marketCapChange, marketCapChangePct: String

    enum CodingKeys: String, CodingKey {
        case volume
        case priceChange = "price_change"
        case priceChangePct = "price_change_pct"
        case volumeChange = "volume_change"
        case volumeChangePct = "volume_change_pct"
        case marketCapChange = "market_cap_change"
        case marketCapChangePct = "market_cap_change_pct"
    }
}


//coinGecko info
/*
 URL: https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=100&page=1&sparkline=false
 
 [
 {
 "id": "bitcoin",
 "symbol": "btc",
 "name": "Bitcoin",
 "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
 "current_price": 119981,
 "market_cap": 2315731646714,
 "market_cap_rank": 1,
 "fully_diluted_valuation": 2522235995549,
 "total_volume": 229101542799,
 "high_24h": 121852,
 "low_24h": 118127,
 "price_change_24h": -646.879887868563,
 "price_change_percentage_24h": -0.53626,
 "market_cap_change_24h": -3013356544.9106445,
 "market_cap_change_percentage_24h": -0.12996,
 "circulating_supply": 19280656,
 "total_supply": 21000000,
 "max_supply": 21000000,
 "ath": 380542,
 "ath_change_percentage": -68.47579,
 "ath_date": "2021-11-09T04:09:45.771Z",
 "atl": 149.66,
 "atl_change_percentage": 80057.72772,
 "atl_date": "2013-07-05T00:00:00.000Z",
 "roi": null,
 "last_updated": "2023-02-03T20:23:26.759Z",
 "sparkline_in_7d": {
 "price": [
 23284.28121653886,
 23205.749283946065,
 ]
 },
 "price_change_percentage_24h_in_currency": -0.5362625695826021
 }
 */
import Foundation


struct CoinModel : Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice : Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
    }
    var rank : Int{
        return Int(marketCapRank ?? 0)
    }
}



struct SparklineIn7D : Codable{
    let price: [Double]?
}




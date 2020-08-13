//
//  Constants.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import Foundation

enum Constants: String {
    case Explore
    case Category
    case Themes
    case Trending
    case TopGainers = "Top Gainers"
    case TopSellers = "Top Sellers"
    case Stock
    case ETFs
    case Crypto
    case DI = "Diversity & Inclusion"
    case BB = "Bold Biotech"
    case CC = "Crypto Center"
    case SRI = "She runs it"
    case CG = "Clean & Green"
}

enum CellIdentifier: String {
    case MenuCollectionViewCell
    case CategoryViewCell
    case ThemeViewCell
    case TrendingViewCell
    case TrendingCell
    case CategoryCell
    case ThemeCell
}

enum APIPath : CustomStringConvertible {
    case GetTopGainers
    case GetTopSellers
    
    var description : String {
        switch self {
        case .GetTopGainers: return "https://financialmodelingprep.com/api/v3/stock/gainers?apikey=dc249aec35baab36761fe986ef988115"
        case .GetTopSellers: return "https://financialmodelingprep.com/api/v3/stock/losers?apikey=dc249aec35baab36761fe986ef988115"
        }
    }
}

enum Messages: String {
    case Ok
    case Fail
    case Success
    case FailToFetchTopGainers = "Fail to Fetch Top Gainers"
    case FailToFetchTopSellers = "Fail to Fetch Top Sellers"
}

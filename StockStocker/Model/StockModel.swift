//
//  StockModel.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/13/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import Foundation

// MARK: - GainerStock
struct GainerStockModel: Codable {
    let mostGainerStock: [StockModel]
}

// MARK: - SellerStock
struct SellerStockModel: Codable {
    let mostLoserStock: [StockModel]
}


// MARK: - MostGainerStock
struct StockModel: Codable {
    let ticker: String
    let changes: Double
    let price, changesPercentage, companyName: String
}

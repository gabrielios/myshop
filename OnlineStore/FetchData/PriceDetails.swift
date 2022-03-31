//
//  PriceDetails.swift
//  OnlineStore
//
//  Created by Gleb Gribov on 31.03.2022.
//

import Foundation

enum Currency {
    case usd
    case eur
    case czk


var code: String {
    switch self {
    case .usd:
        return "USD"
    case .eur:
        return "EUR"
    case .czk:
        return "CZK"
    
    }
}
    

}

struct PriceDetails {
    let currency: Currency
    let rate: String
    
    public init(currency: Currency, rate: String = "--"){
        self.currency = currency
        self.rate = rate
    }
}

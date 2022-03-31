//
//  Product.swift
//  OnlineStore
//
//  Created by Gleb Gribov on 24.03.2022.
//

import Foundation

var viewModel = FetchData()

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Double
}

var price1 = 1.30
var price2 = 0.73
var price3 = 0.95
var price4 = 2.10
var PriceArr = [price1, price2, price3, price4]

var productList = [Product(name: "Milk", image: "obj1", price: PriceArr[0]),
                   Product(name: "Fazole", image: "obj2", price: PriceArr[1]),
                   Product(name: "Hrasek", image: "obj3", price: PriceArr[2]),
                   Product(name: "Vejce", image: "obj4", price: PriceArr[3])]

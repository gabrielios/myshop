//
//  Product.swift
//  OnlineStore
//
//  Created by Gleb Gribov on 24.03.2022.
//

import Foundation

struct Product: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
}

var productList = [Product(name: "Milk", image: "obj1", price: 2),
                   Product(name: "Fazole", image: "obj2", price: 1),
                   Product(name: "Hrasek", image: "obj3", price: 1),
                   Product(name: "Vejce", image: "obj4", price: 3)]

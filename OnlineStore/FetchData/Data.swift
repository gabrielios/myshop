//
//  Data.swift
//  OnlineStore
//
//  Created by Gleb Gribov on 24.03.2022.
//

import SwiftUI
import Foundation



struct Conversion : Decodable {
let success: Bool
    let quotes : [String: Double]
}



struct CurrencyData: Identifiable {
    
    var id = UUID().uuidString
    var curryncyName : String
    var currencyValue : Double
}


class FetchData: ObservableObject {
    @Published var conversionData : [CurrencyData] = []
    public static let shared = FetchData()
   
    init() {
        fetch()
    }
    
    public func fetch() {
        let url = "http://api.currencylayer.com/live?access_key=80a9cf65f8c43aefc562614e6aa4a5b7&format=1"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let JSONData = data else{return}
            do{
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONData)
                print(conversion)
                print(FetchData())
                
                DispatchQueue.main.async {
                    self.conversionData = conversion.quotes.compactMap({ (key,value)
                        -> CurrencyData? in
                        return CurrencyData(curryncyName: key, currencyValue: value)
                        
                    })

                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}



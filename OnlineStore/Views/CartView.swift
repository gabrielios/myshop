//
//  CartView.swift
//  OnlineStore
//
//  Created by Gleb Gribov on 24.03.2022.
//

import SwiftUI



struct CartView: View {
    @State private var selectedCurrency: Currency = .usd
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        
        ScrollView {
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {
                    product in
                    ProductRow(product: product)
                }
                VStack(spacing: 0) {
                    Text("Choose currency")
                        
                    Spacer()
                    HStack(alignment: .center) {
                        Picker(selection: $selectedCurrency, label: Text("Currency"), content: {
                            Text("\(Currency.usd.code)").tag(Currency.usd)
                            Text("\(Currency.eur.code)").tag(Currency.eur)
                            Text("\(Currency.czk.code)").tag(Currency.czk)
                        })
                            .padding(.leading)
                            
                        Spacer()
                    }
                    
                }
                HStack {
                    Text("Your cart total is")
                    Spacer()
                    Text("$\(cartManager.total).00")
                        .bold()
            
                }
                .padding()
                
            }else {
                Text("Your cart is empty")
            }
            
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}

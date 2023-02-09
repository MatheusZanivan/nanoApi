//
//  CoinListView.swift
//  nanoApi
//
//  Created by Julia Mendes on 08/02/23.
//

import SwiftUI

struct CoinListView: View {
    
    @State private var searchCoin = ""
    
    var body: some View {
        NavigationStack {
                List(0 ..< 30) { itens in
                    HStack {
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Moeda")
                            .font(.title2)
                    }
                }
                .navigationTitle("Lista de Moedas")
        }
        .searchable(text: $searchCoin)
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}

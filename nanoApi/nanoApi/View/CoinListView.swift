//
//  CoinListView.swift
//  nanoApi
//
//  Created by Julia Mendes on 08/02/23.
//

import SwiftUI

struct CoinListView: View {
    
    
    @State private var searchCoin = ""
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List(vm.allCoins) { coin in
                NavigationLink {
                    CoinInfo()
                } label: {
                    HStack {
                        AsyncImage(url: URL(string: coin.image)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            
                        } placeholder: {
                            Color.gray
                        }
                        .frame(width: 30, height: 30)
                        Text(coin.name)
                            .font(.title2)
                    }
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

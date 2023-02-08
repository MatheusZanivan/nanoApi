//
//  CoinListView.swift
//  nanoApi
//
//  Created by Julia Mendes on 08/02/23.
//

import SwiftUI

struct CoinListView: View {
    
    var body: some View {
        NavigationView {
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
    }
}

struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListView()
    }
}

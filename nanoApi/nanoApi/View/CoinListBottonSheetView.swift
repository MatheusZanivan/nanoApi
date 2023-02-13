//
//  CoinListBottonSheetView.swift
//  nanoApi
//
//  Created by Julia Mendes on 13/02/23.
//

import SwiftUI

struct CoinListBottonSheetView: View {
    
    @StateObject var vm = HomeViewModel()
    @State var coinValue : Double = 0
    
    var body: some View {
        List(vm.allCoins) { coin in
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
            .onTapGesture {
                coinValue = coin.currentPrice
                print(coinValue)
            }
        }
    }
}
struct CoinListBottonSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListBottonSheetView()
    }
}


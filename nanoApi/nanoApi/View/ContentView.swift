//
//  ContentView.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        VStack {
            List{
                ForEach(vm.allCoins){ coin in
                    Text(String(coin.name))
                    
                }
            }
            .listStyle(PlainListStyle())
        }
        Spacer(minLength: 0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
        .environmentObject(HomeViewModel())
    }
    
        
}

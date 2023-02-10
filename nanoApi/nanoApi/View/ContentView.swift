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
           Text("Vai Palmeiras!")
                .foregroundColor(.green)
                .textCase(.uppercase)
            
            }
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

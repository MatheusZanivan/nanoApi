//
//  nanoApiApp.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 01/02/23.
//

import SwiftUI

@main
struct nanoApiApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(vm)
        }
    }
}

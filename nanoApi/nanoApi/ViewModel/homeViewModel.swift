//
//  homeViewModel.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 07/02/23.
//

import Foundation
import Combine

/*
 ```
 Nossa view tem a referencia para o nosso view model
 Essa view model tem uma variavel chamada dataService onde inicializamos  a classe CoinDataService
 ```
 */

class HomeViewModel : ObservableObject{
    
    @Published var allCoins : [CoinModel] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers()
    }
    
    func addSubscribers(){
        
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}

//
//  CoinDataService.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 07/02/23.
//

import Foundation
import Combine

class CoinDataService {
    
    //quando entram dados em allCoins pelo fato de ser @Published qualquer coisa que tiver subscribed nesse publisher vai ser notificado 
    @Published var allCoins : [CoinModel] = []
    
    var coinSubscription : AnyCancellable?
    
    init(){
        getCoins()
    }
    //https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h
//https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=brl&order=market_cap_desc&per_page=250&page=2&sparkline=true&price_change_percentage=24h") else { return }
        //publisher
        //faz o download dos dados da API
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
        //verifica se os dados são válidos
            .tryMap { (output) -> Data in
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
        // faz o decode desses dados
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            
            .sink{ (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self](returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
                    //pegamos os dados e damos append na nossa array allCoins
            }
            
    }
}

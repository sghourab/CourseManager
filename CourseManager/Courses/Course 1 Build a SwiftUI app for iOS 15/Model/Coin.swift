//
//  Coin.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import Foundation

struct Coin: Identifiable, Decodable {
    var id: Int
    var coin_name: String
    var acronym: String
    var logo: String
}

class CoinModel: ObservableObject {
    @Published var coins: [Coin] = []
    
    @MainActor
    func fetchCoins() async {
        do {
            guard let url = URL(string: "https://random-data-api.com/api/crypto_coin/random_crypto_coin?size=10") else {
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            coins = try JSONDecoder().decode([Coin].self, from: data)
        } catch(let error) {
            print(error)
        }
    }
    
}

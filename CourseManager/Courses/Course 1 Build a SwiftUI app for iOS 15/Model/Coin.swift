//
//  Coin.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import Foundation

struct Coin: Identifiable, Decodable {
    let id: Int
    let coinName: String
    let acronym: String
    let logo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case coinName = "coin_name"
        case acronym
        case logo
    }
}

class CoinModel: ObservableObject {
    @Published private(set) var coins: [Coin] = []
    
    init() {
        Task(priority: .high) {
            await fetchCoins()
        }
    }
    @MainActor
    private func fetchCoins() async {
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

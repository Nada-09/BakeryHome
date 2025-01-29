//
//  Untitled.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

class ChefViewModel: ObservableObject {
    @Published var chefs: [ChefRecord] = []
    
    func fetchChefs(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ChefWelcome.self, from: data)
                DispatchQueue.main.async {
                    self?.chefs = decodedData.records
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }
}

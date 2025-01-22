//
//  BakeryModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 19/07/1446 AH.
//

import Foundation

class CoursesViewModel: ObservableObject {
        @Published var records: [Record] = []
        @Published var isLoading: Bool = false
        @Published var errorMessage: String?

        private let baseURL = "https://api.airtable.com/v0/appXMW3ZsAddTpClm/course"
        private let token = "Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001"

        func fetchCourses() {
            guard let url = URL(string: baseURL) else {
                self.errorMessage = "Invalid URL"
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue(token, forHTTPHeaderField: "Authorization")
            
            isLoading = true
            errorMessage = nil
            
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                DispatchQueue.main.async {
                    self?.isLoading = false
                    
                    if let error = error {
                        self?.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                        return
                    }
                    
                    guard let data = data else {
                        self?.errorMessage = "No data received"
                        return
                    }
                    
                    do {
                        let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                        self?.records = welcome.records
                    } catch {
                        self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                    }
                }
            }.resume()
        }
    }

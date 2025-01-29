//
//  UserViewModel.swift
//  BakeryHome
//
//  Created by Nada Abdullah on 29/07/1446 AH.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [UserRecord] = []
    @Published var selectedUser: UserResponse?
    @Published var errorMessage: String?
    
    func fetchUsers(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.errorMessage = error?.localizedDescription ?? "Unknown error"
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.users = decodedData.records ?? []
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
    
    func fetchUser(by id: String, from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.errorMessage = error?.localizedDescription ?? "Unknown error"
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.selectedUser = decodedData
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
    
    func createUser(_ user: UserFields, to url: URL) {
        guard let jsonData = try? JSONEncoder().encode(user) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.errorMessage = error?.localizedDescription ?? "Unknown error"
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    if let error = decodedData.error {
                        self?.errorMessage = error.message
                    } else {
                        self?.fetchUsers(from: url)
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}

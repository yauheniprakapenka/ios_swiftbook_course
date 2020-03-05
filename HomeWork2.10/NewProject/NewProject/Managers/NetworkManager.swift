//
//  NetworkManager.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.github.com/users/"
    
    func getFollowers(user: String, completed: @escaping (Result<User, HomeWorkError>) -> Void) {
        let endPoint = baseURL + user
        
        guard let url = URL(string: endPoint) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            if let response404 = response as? HTTPURLResponse, response404.statusCode == 404 {
                completed(.failure(.userNotFound))
                return
            }
            
            guard let response200 = response as? HTTPURLResponse, response200.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                print(user)
                completed(.success(user))
            } catch {
                completed(.failure(.dataProcessingError))
            }
        }.resume()
    }
}

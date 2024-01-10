//
//  APIService.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/10.
//

import Foundation

struct APIService {
    let urlEndPoint: String
    
    func getJSONData<T: Decodable>(keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                                   dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate) async throws -> T {
        guard let url = URL(string: urlEndPoint) else { throw APIError.invalidEndpoint}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard !data.isEmpty else { throw APIError.noData }
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw APIError.invalidResponse }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = keyDecodingStrategy
            decoder.dateDecodingStrategy = dateDecodingStrategy
            return try decoder.decode(T.self, from: data)
        } catch let error{
            
            //TODO: remove prints below for testing.
            print("APIService")
            print(error)
            throw APIError.failedToDecode
        }
    }
    
    enum APIError: Error {
        case invalidEndpoint
        case invalidResponse
        case failedToDecode
        case noData
    }
}

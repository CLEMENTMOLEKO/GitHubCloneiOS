//
//  APIService.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/10.
//

import Foundation

struct APIService {
    func getJSONData<T: Decodable>(
        from urlString: String,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate
    ) async -> Result<T, APIError> {
        let dataResult = await getData(from: urlString)
        switch dataResult {
        case .success(let data):
            return decodeJsonData(
                data,
                keyDecodingStrategy: keyDecodingStrategy,
                dateDecodingStrategy: dateDecodingStrategy
            )
        case .failure(let error):
            print("Error getting JSON Data: \(error.localizedDescription)")
            return .failure(error)
        }
    }
    
    func getData(from urlString: String) async -> Result<Data, APIError> {
        guard let url = URL(string: urlString) else { return .failure(.invalidEndpoint)}
       
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            print("DATA: \(String(decoding: data, as: Unicode.UTF8.self)), RESPONSE: \(response)")
            guard !data.isEmpty else { return .failure(.noData)}
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else { return .failure(.invalidResponse)}
            return .success(data)
        } catch {
            return .failure(.failedToDecode)
        }
    }
    
    private func decodeJsonData<T: Decodable>(
        _ data: Data,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy
    ) -> Result<T, APIError> {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = keyDecodingStrategy
            decoder.dateDecodingStrategy = dateDecodingStrategy
            let decodedJsonData = try decoder.decode(T.self, from: data)
            return .success(decodedJsonData)
        } catch let error{
            //TODO: remove prints below for testing.
            print("APIService")
            print(error)
            return .failure(.failedToDecode)
        }
    }
}

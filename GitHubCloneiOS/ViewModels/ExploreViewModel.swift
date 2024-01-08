//
//  ExploreViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/05.
//

import Foundation

@MainActor
final class ExploreViewModel : ObservableObject {
    @Published var searchValue = ""
    @Published var repositories: [Repository] = []
    
    enum RequestError: Error {
        case invalidEndpoint
        case invalidResponse
        case failedToDecode
    }
    
    let gitHubItems: [Item] = [
        Item(name: "Trending Repositories", systemImage: "flame", systemImageColor: .purple),
        Item(name: "Awesome LIsts", systemImage: "face.smiling", systemImageColor: .pink),
    ]
    
    func getRepositories() async throws {
        let endpoint = "https://api.github.com/repositories"

        guard let url = URL(string: endpoint) else { throw RequestError.invalidEndpoint}
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw RequestError.invalidResponse}
        
        do {
            let decoder = JSONDecoder()
            repositories = try decoder.decode([Repository].self, from: data)
            print("Successfully decoded")
            dump(repositories)
        } catch let error {
            print("Error decoded \(error)")
            throw RequestError.failedToDecode
        }
    }
}

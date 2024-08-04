//
//  FavoritesViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/15.
//

import Foundation

final class FavoritesViewModel: ObservableObject {
    @Published var userRepositories = [Repository]()
    @Published var requestState: RequestState = .loading
    @Published var searchableValue: String = ""
    
    enum RequestState {
        case loading, success, failure
    }
    
    func getUserRepositories() async {
        //TODO: remember user should come authenticated user or use user defaults or swiftdata/core data if auth not implemented yet.
        let apiService = APIService(urlEndPoint: "https://api.github.com/users/clementmoleko/repos")
        do {
            let repositoriesResult: [Repository] = try await apiService.getJSONData(dateDecodingStrategy: .iso8601)
            await MainActor.run {
                userRepositories = repositoriesResult
                requestState = .success
            }
        } catch {
            requestState = .failure
        }
    }
}

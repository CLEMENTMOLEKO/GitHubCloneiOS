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
        let apiService = APIService()
        let repositoriesResult: Result<[Repository], APIError> = await apiService.getJSONData(
            from: "https://api.github.com/users/clementmoleko/repos",
            dateDecodingStrategy: .iso8601
        )
        switch repositoriesResult {
        case .success(let repos):
            await MainActor.run {
                userRepositories = repos
                requestState = .success
            }
        case .failure(let _):
            requestState = .failure
        }
    }
}

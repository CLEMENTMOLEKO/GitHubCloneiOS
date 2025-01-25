//
//  StarredRepositories.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/01/18.
//

import Foundation
import Observation

@Observable
final class StarredRepositoriesViewModel {
    @ObservationIgnored let apiService: APIService = APIService() //TODO: Should be injected.
    @ObservationIgnored let userLogin: String
    
    var searchText: String = ""
    var repositories: [Repository] = []
    var loadingState: LoadingState = .loading
    
    init(userLogin: String? = nil) {
        self.userLogin = userLogin ?? UserDefaults.standard.string(forKey: "current_user_login")!
    }
    
    func fetchStarredRepositories() async {
        let endpoint = "https://api.github.com/users/\(userLogin)/starred"
        let repositoriesResult: Result<[Repository], APIError> = await apiService.getJSONData(
            from: endpoint,
            keyDecodingStrategy: .convertFromSnakeCase
        )
    
        switch repositoriesResult {
        case .success(let repositories):
            self.repositories = repositories
            loadingState = .success
        case .failure(_):
            loadingState = .failure
        }
    }
}

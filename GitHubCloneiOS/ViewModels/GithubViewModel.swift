//
//  GithubViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/20.
//

import Foundation

@MainActor
final class GithubViewModel: ObservableObject {
    @Published var repositories = [Repository]()
    @Published var requestState: RequestState = .loading
    
    enum RequestState {
        case loading, success, failure
    }
    
    func getLoggedInUserRepositories(userLogin user: String) async {
        let apiService = APIService(urlEndPoint: "https://api.github.com/users/\(user)/repos")
        
        do {
            try await repositories = apiService.getJSONData(dateDecodingStrategy: .iso8601)
            requestState = .success
        } catch {
            requestState = .failure
        }
    }
}

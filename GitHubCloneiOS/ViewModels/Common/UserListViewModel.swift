//
//  UserListViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/08.
//

import Foundation
import Observation

@Observable
final class UserListViewModel {
    let apiService: APIService = .init()
    let userEndpoint: String
    var users: [User] = []
    var usersState: LoadingState = .loading
    
    init(userEndpoint: String) {
        self.userEndpoint = userEndpoint
    }
    
    func getFollowers() async {
        let result: Result<[User], APIError> = await apiService.getJSONData(
            from: userEndpoint,
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        switch result {
        case .success(let users):
            self.users = users
            usersState = .success
        case .failure(_):
            usersState = .failure
        }
    }
}

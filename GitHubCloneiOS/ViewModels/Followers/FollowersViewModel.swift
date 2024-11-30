//
//  FollowersViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import Foundation
import Observation

@Observable
class FollowersViewModel {
    let apiService: APIService = .init()
    var followers: [User] = []
    var followersState: LoadingState = .loading
    
    func getFollowers() async {
        let result: Result<[User], APIError> = await apiService.getJSONData(
            from:"https://api.github.com/users/CLEMENTMOLEKO/followers",
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        switch result {
        case .success(let followers):
            self.followers = followers
            followersState = .success
        case .failure(_):
            followersState = .failure
        }
    }
}

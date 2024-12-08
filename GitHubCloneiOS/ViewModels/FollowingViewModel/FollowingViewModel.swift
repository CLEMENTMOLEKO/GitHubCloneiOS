//
//  FollowersViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import Foundation
import Observation

@Observable
class FollowingViewModel {
    let apiService: APIService = .init()
    var following: [User] = []
    var followingState: LoadingState = .loading
    
    func getFollowers() async {
        let result: Result<[User], APIError> = await apiService.getJSONData(
            from:"https://api.github.com/users/CLEMENTMOLEKO/following",
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        switch result {
        case .success(let followers):
            self.following = followers
            followingState = .success
        case .failure(_):
            followingState = .failure
        }
    }
}

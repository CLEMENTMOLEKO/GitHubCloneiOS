//
//  ProfileNavigationValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import Foundation
import SwiftUI

enum ProfileNavigationValues: NavigationDestination {
    var id: Self {self}
    
    case following(userLogin: String? = nil)
    case followers(userLogin: String? = nil)
    case repositories(userLogin: String? = nil)
    case starred(userLogin: String? = nil)
    case profile(userLogin: String)
    case organizations
    
    var body: some View {
        switch self {
        case .following(let userLogin):
            FollowingView(userLogin: userLogin)
        case .followers(let userLogin):
            FollowersView(userLogin: userLogin)
        case .repositories(let userLogin):
            RepositoriesView(userLogin: userLogin)
        case .starred(let userLogin):
            StarredRepositoriesView(userLogin: userLogin)
        case .profile(let userLogin):
            ProfileView(userLogin: userLogin)
        case .organizations:
            Text("organization View")
        }
    }
}

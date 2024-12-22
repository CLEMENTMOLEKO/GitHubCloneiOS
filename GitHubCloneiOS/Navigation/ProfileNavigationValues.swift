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
    case starred
    case profile(userLogin: String)
    
    var body: some View {
        switch self {
        case .following(let userLogin):
            FollowingView(userLogin: userLogin)
        case .followers(let userLogin):
            FollowersView(userLogin: userLogin)
        case .starred:
            Text("Starred View")
        case .profile(let userLogin):
            ProfileView(userLogin: userLogin)
        }
    }
}

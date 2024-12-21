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
    
    case following
    case followers
    case starred
    case profile(userLogin: String)
    
    var body: some View {
        switch self {
        case .following:
            FollowingView()
        case .followers:
            FollowersView()
        case .starred:
            Text("Starred View")
        case .profile(let userLogin):
            ProfileView(userLogin: userLogin)
        }
    }
}

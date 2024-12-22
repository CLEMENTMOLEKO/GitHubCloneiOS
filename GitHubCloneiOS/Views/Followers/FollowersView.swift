//
//  FollowersView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import SwiftUI

struct FollowersView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @AppStorage("current_user_login") var currentUserLogin: String?
    let userLogin: String?
    
    init (userLogin: String? = nil) {
        self.userLogin = userLogin
    }
    
    var followersEndpoint: String {
        return "https://api.github.com/users/\(userLogin ?? currentUserLogin!)/followers"
    }
    
    var body: some View {
        UserListView(userEndpoint: followersEndpoint) { user in
            navigationManager.navigate(
                to: ProfileNavigationValues.profile(
                    userLogin: user.login
                )
            )
        } contentUnavailableView: {
            ContentUnavailableView(
                "No followers yet",
                systemImage: "person.fill.xmark"
            )
        }
    }
}

#Preview {
    FollowersView()
}

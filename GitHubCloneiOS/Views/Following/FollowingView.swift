//
//  FollowingView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/08.
//

import SwiftUI

struct FollowingView: View {
    @AppStorage("current_user_login") var currentUserLogin: String?
    @EnvironmentObject var navigationManager: NavigationManager
    let userLogin: String?
    
    init(userLogin: String? = nil) {
        self.userLogin = userLogin
    }

    //TODO: Remove computed property and pass following endpoint or userlogin.
    var followingEndpoint: String {
        return "https://api.github.com/users/\(userLogin ?? currentUserLogin!)/following"
    }

    var body: some View {
        UserListView(userEndpoint: followingEndpoint) { user in
            navigationManager.navigate(
                to: ProfileNavigationValues.profile(
                    userLogin: user.login
                )
            )
        } contentUnavailableView: {
            ContentUnavailableView(
                "Not following anyone yet",
                systemImage: "person.fill.xmark"
            )
        }
    }
}

#Preview {
    FollowingView()
}

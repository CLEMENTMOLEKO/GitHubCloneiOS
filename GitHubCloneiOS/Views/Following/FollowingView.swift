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

    //TODO: Remove computed property and pass following endpoint or userlogin.
    var followingEndpoint: String {
        guard let userLogin = currentUserLogin else {
            return "" // Handle a default or empty case appropriately
        }
        return "https://api.github.com/users/\(userLogin)/following"
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
                image: "person.2"
            )
        }
    }
}

#Preview {
    FollowingView()
}

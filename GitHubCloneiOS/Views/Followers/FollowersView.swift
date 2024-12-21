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
    
    var followersEndpoint: String {
        guard let userLogin = currentUserLogin else {
            return ""
        }
        
        return "https://api.github.com/users/\(userLogin)/followers"
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
                image: "person.2"
            )
        }
    }
}

#Preview {
    FollowersView()
}

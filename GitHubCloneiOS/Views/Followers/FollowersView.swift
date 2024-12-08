//
//  FollowersView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import SwiftUI

struct FollowersView: View {
    let followersEndpoint: String = "https://api.github.com/users/CLEMENTMOLEKO/followers"
    
    var body: some View {
        UserListView(userEndpoint: followersEndpoint) {
            ContentUnavailableView("No followers yet", image: "person.2")
        }
    }
}

#Preview {
    FollowersView()
}

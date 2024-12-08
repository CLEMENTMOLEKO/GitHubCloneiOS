//
//  FollowingView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/08.
//

import SwiftUI

struct FollowingView: View {
    let viewModel: FollowingViewModel = .init()
    let followingEndpoint: String = "https://api.github.com/users/CLEMENTMOLEKO/following"
    
    var body: some View {
        UserListView(userEndpoint: followingEndpoint) {
            ContentUnavailableView("No following anyone yet", image: "person.2")
        }
    }
}

#Preview {
    FollowingView()
}

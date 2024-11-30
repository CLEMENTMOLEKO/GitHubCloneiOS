//
//  FollowersView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import SwiftUI

struct FollowersView: View {
    let viewModel: FollowersViewModel = .init()
    
    var body: some View {
        Group {
            switch viewModel.followersState {
            case .loading:
                ProgressView()
            case .success:
                if viewModel.followers.isEmpty {
                   ContentUnavailableView("No followers", image: "person.2")
                } else {
                    follwers
                }
            case .failure:
                Text("Error")
            }
        }
        .task {
            await viewModel.getFollowers()
        }
    }
    
    private var follwers: some View {
        List(viewModel.followers) { follower in
           HStack {
               CachedAvatarView(
                imageKey: follower.login,
                imageUrl: follower.avatarUrl ?? ""
               )
               .frame(width: 40)
               VStack(alignment: .leading) {
                   //TODO: followers don't return follwer information, check if we can request more based on id.
                   if let name = follower.name {
                       Text(name)
                           .font(.headline)
                   }
                   
                   Text(follower.login)
                       .font(.headline)
                   if let bio = follower.bio {
                       Text(bio)
                   }
               }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    FollowersView()
}

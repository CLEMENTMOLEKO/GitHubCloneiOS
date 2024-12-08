//
//  UserListView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/08.
//

import SwiftUI

struct UserListView<Content: View>: View {
    let userEndpoint: String
    let contentUnavailableView: Content
    let viewModel: UserListViewModel
    
    init (userEndpoint: String, @ViewBuilder content: () -> Content) {
        self.contentUnavailableView = content()
        self.userEndpoint = userEndpoint
        viewModel = UserListViewModel(userEndpoint: userEndpoint)
    }
    
    var body: some View {
        Group {
            switch viewModel.usersState {
            case .loading:
                ProgressView()
            case .success:
                if viewModel.users.isEmpty {
                    contentUnavailableView
                } else {
                    users
                }
            case .failure:
                Text("Error")
            }
        }
        .task {
            await viewModel.getFollowers()
        }
        
    }
    
    private var users: some View {
        List(viewModel.users) { user in
           HStack {
               CachedAvatarView(
                imageKey: user.login,
                imageUrl: user.avatarUrl ?? ""
               )
               .frame(width: 40)
               VStack(alignment: .leading) {
                   //TODO: followers don't return follwer information, check if we can request more based on id.
                   if let name = user.name {
                       Text(name)
                           .font(.headline)
                   }
                   
                   Text(user.login)
                       .font(.headline)
                   if let bio = user.bio {
                       Text(bio)
                   }
               }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    UserListView(userEndpoint:"https://api.github.com/users/CLEMENTMOLEKO/following") {
        ContentUnavailableView("Users Unavailable", systemImage: "person.2")
    }
}

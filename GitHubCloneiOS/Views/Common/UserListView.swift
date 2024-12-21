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
    let onUserSelected: ((User) -> Void)?
    
    init(
        userEndpoint: String,
        onUserSelected: ((User) -> Void)? = nil,
        @ViewBuilder contentUnavailableView: () -> Content
    ) {
        self.contentUnavailableView = contentUnavailableView()
        self.userEndpoint = userEndpoint
        self.onUserSelected = onUserSelected
        self.viewModel = UserListViewModel(userEndpoint: userEndpoint)
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
           .onTapGesture {
               onUserSelected?(user)
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

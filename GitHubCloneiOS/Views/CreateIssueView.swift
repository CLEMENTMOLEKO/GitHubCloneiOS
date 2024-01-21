//
//  CreateIssueView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/19.
//

import SwiftUI

struct CreateIssueView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var githubViewModel: GithubViewModel
    @StateObject var vm: CreateIssueViewModel = .init()
    
    var body: some View {
        NavigationStack {
            switch githubViewModel.requestState {
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .task {
                        //TODO: this should come from the logged in users login
                        await githubViewModel.getLoggedInUserRepositories(userLogin: "clementmoleko")
                    }
            case .success:
                repoList
            case .failure:
                NoconnectionView()
            }
        }
    }
}

private extension CreateIssueView {
    private var repoList: some View {
        List {
            Section {
                ForEach(githubViewModel.repositories){ repo in
                    NavigationLink(value: ""){
                        AvatarListTile(avatarUrl: repo.owner.avatarURL, title: repo.owner.login, subtitle: repo.name)
                    }
                }
            }
        }
        .contentMargins(0)
        .listStyle(.grouped)
        .toolbarTitleDisplayMode(.inline)
        .searchable(text: $vm.searchableText, placement: .navigationBarDrawer(displayMode: .always))
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel", role: .cancel) {
                    dismiss()
                }
            }
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Choose a repository")
                        .foregroundColor(.secondary)
                        .font(.caption)
                    Text("Create a new issue")
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    CreateIssueView()
        .environmentObject(GithubViewModel())
}

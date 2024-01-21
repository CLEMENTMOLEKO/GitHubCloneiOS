//
//  FavoritesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/15.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var vm: FavoritesViewModel = .init()
    @EnvironmentObject var gitHubViewModel: GithubViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                selectedRepos
                unselectedRepos
            }
            .listStyle(.grouped)
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $vm.searchableValue, placement: .navigationBarDrawer(displayMode: .always))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            .task {
                await gitHubViewModel.getLoggedInUserRepositories(userLogin: "clementmoleko")
            }
        }
    }
}

private extension FavoritesView {
    private var selectedRepos: some View {
        Section {
            Text("No repositories selected")
                .font(.subheadline)
        } header: {
            Text("Selected")
        }
    }
    
    private var unselectedRepos: some View {
        Section {
            switch gitHubViewModel.requestState {
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity)
            case .success:
                FavoritesList()
            case .failure:
                NoconnectionView()
            }
        } header: {
            Text("Select Repositories")
        }
    }
}

private struct FavoritesList: View {
    @EnvironmentObject var githubViewModel: GithubViewModel
    
    var body: some View {
        ForEach(githubViewModel.repositories){ repo in
            AvatarListTile(showAddImageCirlce: true, avatarUrl: repo.owner.avatarURL, title: repo.owner.login, subtitle: repo.name)
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(GithubViewModel())
}

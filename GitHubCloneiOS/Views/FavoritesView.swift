//
//  FavoritesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/15.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject var vm: FavoritesViewModel = .init()
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
                await vm.getUserRepositories()
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
            switch vm.requestState {
            case .loading:
                ProgressView()
                    .frame(maxWidth: .infinity)
            case .success:
                ForEach(vm.userRepositories){ repo in
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.green)
                        AsyncImage(url: URL(string: repo.owner.avatarURL ?? "")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder: {
                            Circle()
                                .fill(.gray)
                        }
                        .frame(width: 30)
                        VStack {
                            Text(repo.owner.login)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text(repo.name)
                                .font(.headline)
                        }
                    }
                }
            case .failure:
                VStack {
                    Image(systemName: "network.slash")
                        .font(.system(size: 40))
                        .symbolRenderingMode(.multicolor)
                        .frame(maxWidth: .infinity)
                    Text("Error Connecting")
                }
            }
        } header: {
            Text("Select Repositories")
        }
    }
}

#Preview {
    FavoritesView()
}

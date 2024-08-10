//
//  RepositoriesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct RepositoriesView: View {
    @StateObject var viewModel = RepositoriesVeiwModel();
    
    @State var type = "";
    
    var body: some View {
        Group {
            switch viewModel.repositoriesState {
            case .loading:
                ProgressView()
            case .success:
                if viewModel.repositories.isEmpty {
                    ContentUnavailableView(
                        "Not repositories found",
                        systemImage: "arrow.triangle.branch"
                    )
                } else {
                    List {
                        ForEach(viewModel.repositories) { repository in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    CachedAvatarView(
                                        imageKey: "\(repository.owner.id)",
                                        imageUrl: repository.owner.avatarURL ?? ""
                                    )
                                    .frame(width: 30)
                                    Text(repository.owner.login)
                                        .font(.callout)
                                }
                                Text(repository.name)
                                    .font(.headline)
                                if let description = repository.description {
                                    Text(description)
                                }
                                HStack {
                                    if let stargazerCount = repository.stargazersCount,
                                        stargazerCount > 0 {
                                        Image(systemName: "star")
                                            .symbolVariant(.fill)
                                            .foregroundStyle(.yellow)
                                    } else {
                                        Image(systemName: "star")
                                            .foregroundColor(.secondary)
                                    }
                                    
                                    Text("\(repository.stargazersCount ?? 0)")
                                }
                            }
                        }
                        
                    }
                    .listStyle(.grouped)
                }
            case .failure:
                Text("error getting repos")
            }
        }
        .navigationTitle("Repositories")
        .task {
            await viewModel.getRepositories()
        }
    }
}

#Preview {
    NavigationStack {
        RepositoriesView()
    }
}

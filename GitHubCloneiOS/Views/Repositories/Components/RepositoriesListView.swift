//
//  RepositoriesListView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import SwiftUI

struct RepositoriesListView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    let repositories: [Repository]
    
    var body: some View {
        List {
            ForEach(repositories) { repository in
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        CachedAvatarView(
                            imageKey: "\(repository.owner.id)",
                            imageUrl: repository.owner.avatarURL ?? ""
                        )
                        .frame(width: 30)
                        Text(repository.owner.login)
                            .font(.callout)
                        Spacer()
                    }
                    Text(repository.name)
                        .font(.headline)
                    if let description = repository.description {
                        Text(description)
                            .font(.subheadline)
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
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    navigationManager.navigate(
                        to: .repositoryDetail(
                            repository: repository
                        )
                    )
                }
            }
            
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    RepositoriesListView()
//}

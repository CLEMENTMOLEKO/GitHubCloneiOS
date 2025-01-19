//
//  RepositoryCardView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/01/19.
//

import SwiftUI

struct RepositoryCardView: View {
    let repository: Repository
    
    var body: some View {
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
    }
}

#Preview {
//TODO: create mock repository data for previews.
//    RepositoryCardView()
}

//
//  CommitsList.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/09/21.
//

import SwiftUI

struct CommitsList: View {
    let commits: [Commit]
    let relativeDateFormatter = RelativeDateTimeFormatter()
    
    var body: some View {
        if commits.isEmpty {
            ContentUnavailableView(
                "No commits available",
                image: "star.fill"
            )
        } else {
            List {
                ForEach(commits) { commit in
                    commitCell(commit: commit)
                        .badge(Date.timeAgo(from: commit.commit.committer.date))
                }
                .listRowSpacing(0)
            }
            .listStyle(.plain)
        }
    }
    
    private func commitCell(commit: Commit) -> some View {
        VStack(alignment: .leading) {
            Text(commit.commit.message)
                .lineLimit(1)
                .font(.title3)
                .fontWeight(.semibold)
            HStack {
                CachedAvatarView(
                    imageKey: commit.author.login,
                    imageUrl: commit.author.avatarUrl
                )
                .frame(width: 20)
                Text(commit.author.login)
                    .font(.headline)
                Text("authored")
                    .foregroundStyle(.secondary)
            }
        }
    }
    
//TODO: Pull request associated with commits. list commits screen also lists pull requests.
//    private func pullRequestCommitCell(commit: PullRequestCommit) -> some View {
//        VStack(alignment: .leading) {
//            Text(commit.commit.message)
//                .font(.title3)
//                .fontWeight(.semibold)
//            HStack {
//                Circle()
//                    .frame(width: 20)
//                Text(commit.commit.author.name)
//                    .font(.headline)
//            }
//        }
//    }
}

#Preview {
    CommitsList(commits:[])
}

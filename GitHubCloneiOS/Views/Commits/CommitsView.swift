//
//  CommitsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/09/21.
//

import SwiftUI

struct CommitsView: View {
    @StateObject private var commitsViewModel: CommitsViewModel = .init()
    
    let owner: String
    let repoName: String
    
    var body: some View {
        Group {
            switch commitsViewModel.commitState {
            case .failure: Text("Error: Unknown error")
            case .loading: ProgressView()
            case .success: CommitsList(commits: commitsViewModel.commits)
            }
        }
        .refreshable {
            await commitsViewModel.getCommits(for: owner, name: repoName)
        }
        .task {
            await commitsViewModel.getCommits(for: owner, name: repoName)
        }
        .navigationTitle("Commits")
        .navigationBarTitleDisplayMode(.inline)
    }

}

#Preview {
    NavigationStack {
        CommitsView(owner: "CLEMENTMOLEKO", repoName: "GihubIOSClone")
            .preferredColorScheme(.dark)
    }
}

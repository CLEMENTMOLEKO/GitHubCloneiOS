//
//  CommitsViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/09/21.
//

import Foundation

final class CommitsViewModel: ObservableObject {
    let apiService: APIService = .init()
    
    @Published var commits: [Commit] = []
    @Published var commitState: LoadingState = .loading
   
    func getCommits(for owner: String, name: String) async {
       await downloadCommits(for: owner, repoName: name)
    }
    
    func downloadCommits(for owner: String, repoName: String) async {
        let url = "https://api.github.com/repos/\(owner)/\(repoName)/commits";
        let commitsResults: Result<[Commit], APIError> = await apiService.getJSONData(
            from: url,
            keyDecodingStrategy: .convertFromSnakeCase
        )
        
        switch commitsResults {
        case .success(let commits):
            print("success getting commits")
            await MainActor.run { //TODO: in concurrency is this really needed? as swift might switch threads accordingly if we make the class main actor.
                self.commits = commits
                commitState = .success
            }
        case .failure(_):
            print("failure getting a commits")
            await MainActor.run {
                commitState = .failure
            }
        }
    }
}

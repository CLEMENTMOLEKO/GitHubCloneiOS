//
//  RepositoryDetailsViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//
//
//
// https://docs.github.com/en/rest/repos/repos?apiVersion=2022-11-28#get-a-repository

import Foundation

class RepositoryDetailsViewModel : ObservableObject {
    let apiService = APIService()
    //  https://api.github.com/repos/OWNER/REPO
    
    @Published var repositoryState: LoadingState = .loading
    @Published var repository: Repository? = nil
    
    func getRepository(for owner: String, name: String) async {
       await downloadRepository(for: owner, name: name)
    }
    
    func downloadRepository(for owner: String, name: String) async {
        let url = "https://api.github.com/repos/\(owner)/\(name)";
        let repositoryResults: Result<Repository, APIError> = await apiService.getJSONData(from: url)
        
        switch repositoryResults {
        case .success(let repository):
            print("success getting a repo")
            await MainActor.run {
                self.repository = repository
                repositoryState = .success
            }
        case .failure(_):
            print("failure getting a repo")
            await MainActor.run {
                repositoryState = .failure
            }
        }
    }
}

//
//  RepositoriesVeiwModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import Foundation

class RepositoriesVeiwModel: ObservableObject {
    let apiService = APIService()
    let cacheManager = CacheManager.shared
    
    @Published var repositoriesState: LoadingState = .loading
    @Published var repositories = [Repository]()
   
    //TODO: userId should be somewhere like in userDefaults/SwifData
    func getRepositories(for userName: String = "clementmoleko", userId: Int = 105995526) async {
        print("getting repos")
        if let cachedRepositoriesData = await cacheManager.getObject(forkey: "Repositories_\(userId)") {
            print("getting cached repos")
            let decoder = JSONDecoder();
            do {
                repositories = try decoder.decode([Repository].self, from: cachedRepositoriesData)
                repositoriesState = .success
            } catch {
                print("Decoding repos error")
                repositoriesState = .failure
            }
        } else {
            await downloadUserRepositories(for: userName)
        }
    }
    
    private func downloadUserRepositories(for userName: String ) async {
        let url = "https://api.github.com/users/\(userName)/repos";
        let userRepositoriesResult: Result<[Repository], APIError> = await apiService.getJSONData(from: url)
        print("download repos")
        switch userRepositoriesResult {
        case .success(let userRepositories):
            print("success getting repos")
            await MainActor.run {
                repositories = userRepositories
                repositoriesState = .success
            }
        case .failure(_):
            print("failure getting repos")
            await MainActor.run {
                repositoriesState = .failure
            }
        }
    }
}

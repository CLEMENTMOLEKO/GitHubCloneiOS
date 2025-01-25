//
//  RepositoriesVeiwModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import Foundation

@Observable
class RepositoriesVeiwModel {
    @ObservationIgnored let apiService = APIService()
    @ObservationIgnored let cacheManager = CacheManager.shared
    @ObservationIgnored var userLogin: String = ""
    
    var repositoriesState: LoadingState = .loading
    var repositories = [Repository]()
    
    init(userLogin: String?) {
        self.userLogin = userLogin ?? UserDefaults.standard.string(
            forKey: "current_user_login"
        )!
    }
   
    //TODO: userId should be somewhere like in userDefaults/SwifData
    func getRepositories(
        for userName: String = "clementmoleko",
        userId: Int = 105995526
    ) async {
        print("getting repos")
        guard let cachedRepositoriesData = await cacheManager.getObject(forkey: "Repositories_\(userId)") else {
            await downloadUserRepositories(for: userName)
            return
        }
        print("getting cached repos")
        let decoder = JSONDecoder();
        do {
            repositories = try decoder.decode([Repository].self, from: cachedRepositoriesData)
            repositoriesState = .success
        } catch {
            print("Decoding repos error")
            repositoriesState = .failure
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

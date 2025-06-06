//
//  ExploreViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/05.
//

import Foundation

@MainActor
final class ExploreViewModel : ObservableObject {
    @Published var searchValue = ""
    @Published var repositories: [Repository] = []
    @Published var repositoriesState: LoadingState = .loading
    
    let gitHubItems: [ExploreItem] = [
        ExploreItem(title: "Trending Repositories", systemImage: "flame", iconBackgroundColor: .purple),
        ExploreItem(title: "Awesome LIsts", systemImage: "face.smiling", iconBackgroundColor: .pink),
    ]
    
    func getRepositories() async {
        let apiService = APIService()
        let repositoriesResult: Result<[Repository], APIError> = await apiService.getJSONData(from: "https://api.github.com/repositories")
        
        switch repositoriesResult {
        case .success(let apiRepositories):
            repositories = apiRepositories
            repositoriesState = .success
        case .failure(_):
            repositoriesState = .failure
        }
    }
}

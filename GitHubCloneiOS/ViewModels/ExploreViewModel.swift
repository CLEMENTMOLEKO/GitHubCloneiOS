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
    @Published var isLoading = false //TODO: create an enum for states of success, failure and loading.
    
    let gitHubItems: [Item] = [
        Item(name: "Trending Repositories", systemImage: "flame", systemImageColor: .purple),
        Item(name: "Awesome LIsts", systemImage: "face.smiling", systemImageColor: .pink),
    ]
    
    func getRepositories() async {
        let apiService = APIService(urlEndPoint: "https://api.github.com/repositories")
        do {
            isLoading = true
            repositories = try await apiService.getJSONData()
            isLoading = false
        } catch {
            isLoading = false
        }
    }
}

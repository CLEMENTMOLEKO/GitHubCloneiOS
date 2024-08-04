//
//  ProfileViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    enum UserState {
        case loading, success, failed
    }
    
    let gitHubItems: [ProfileItem] = [
        ProfileItem(name: "Repositories", systemImage: "checkmark.rectangle.stack.fill", systemImageColor: .gray),
        ProfileItem(name: "Starred", systemImage: "star", systemImageColor: .yellow),
        ProfileItem(name: "Organizations", systemImage: "building.2", systemImageColor: .orange),
    ]
    
    @Published var user: User? = nil
    @Published var userState: UserState = .loading
    
    func getUser() async {
        //TODO: user url should come from logged in user, for now we can use user defaults.
        let apiService = APIService(urlEndPoint: "https://api.github.com/users/clementmoleko")
        do {
            userState = .loading
            user = try await apiService.getJSONData(keyDecodingStrategy: .convertFromSnakeCase,
                                                    dateDecodingStrategy: .iso8601)
            userState = .success
        } catch let error {
            print(error)
            userState = .failed
        }
    }
}

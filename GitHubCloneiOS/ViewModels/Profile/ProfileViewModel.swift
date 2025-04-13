//
//  ProfileViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    let gitHubItems: [ProfileItem] = [
        ProfileItem(
            title: "Repositories",
            systemImage: "checkmark.rectangle.stack.fill",
            iconBackgroundColor: .gray,
            navigationItem: .repositories()
        ),
        ProfileItem(
            title: "Starred",
            systemImage: "star",
            iconBackgroundColor: .yellow,
            navigationItem: .starred()
        ),
        ProfileItem(
            title: "Organizations",
            systemImage: "building.2",
            iconBackgroundColor: .orange,
            navigationItem: .organizations
        ),
    ]
    
    @Published var user: User? = nil
    @Published var userState: LoadingState = .loading
    let userLogin: String
    
    init(userLogin: String) {
        self.userLogin = userLogin
    }
    
    func getUser() async {
        let apiService = APIService()

        let userResult: Result<User, APIError> = await apiService.getJSONData(
            //TODO: user url should come from logged in user, for now we can use user defaults.
            from: "https://api.github.com/users/\(userLogin)",
            keyDecodingStrategy: .convertFromSnakeCase,
            dateDecodingStrategy: .iso8601
        )
        switch userResult {
        case .success(let apiUser):
            user = apiUser
            userState = .success
        case .failure(_):
            userState = .failure
        }
    }
}

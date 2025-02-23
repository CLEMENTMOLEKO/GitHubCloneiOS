//
//  IssuesViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/02/16.
//

import Foundation
import Observation

@Observable
final class IssuesViewModel {
    @ObservationIgnored let apiService: APIService = .init()
    
    //Selections
    var selectedOpen = OpenState.open
    var selectedCreator = CreatedBy.me
    var selectedVisibility = Visibility.all
    var selectedOrg = Organization.all

    
    var searchText = ""
    var issues: [Issue] = []
    var issuesState: LoadingState = .loading
    
    func fetchIssues() async throws {
        //The below list authenticated users issues, prolly auth via cookies.
        let URLString = "https://api.github.com/issues"
        let issuesResult: Result<[Issue], APIError> = await apiService.getJSONData(
            from: URLString,
            keyDecodingStrategy: .convertFromSnakeCase
        )
       
        switch issuesResult {
        case .failure(let error):
            print("Error fetching issues: \(error)")
            issuesState = .failure
        case .success(let issues):
            self.issues = issues
            issuesState = .success
        }
    }
}

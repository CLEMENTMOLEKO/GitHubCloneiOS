//
//  HomeNavigationValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/07/13.
//

import SwiftUI

enum HomeNavigationValues: NavigationDestination {
    case issues
    case pullRequests
    case discussions
    case projects
    case repositories
    case repositoryDetail(repository: Repository)
    case starred
    case organizations
    case commits(owner: String, repoName: String)
    case code(path: String? = nil, owner: String, repoName: String)
    
    var id: Self { self }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //TODO: Add and check if overriding equality is needed.
    
    var body: some View {
        switch self {
        case .issues:
            IssuesView()
//        case .pullRequests:
//        case .discussions:
//        case .projects:
        case .repositories:
            RepositoriesView()
        case .repositoryDetail(let repository):
            RepositoryDetailsView(repository: repository)
        case .starred:
            StarredRepositoriesView()
//        case .organizations:
        case .commits(let owner, let repoName):
            CommitsView(owner: owner, repoName: repoName)
        case .code(let path, let owner, let repoName):
            CodeContentView(path: path, owner: owner, repoName: repoName)
        default:
            Text("Test Home Navigation")
        }
    }
}

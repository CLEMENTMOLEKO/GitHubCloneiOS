//
//  RepositoriesListView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import SwiftUI

struct RepositoriesListView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    
    let repositories: [Repository]
    
    var body: some View {
        List {
            ForEach(repositories) { repository in
                RepositoryCardView(repository: repository)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        navigationManager.navigate(
                            to: HomeNavigationValues.repositoryDetail(
                                repository: repository
                            )
                        )
                    }
            }
            
        }
        .listStyle(.plain)
    }
}

//#Preview {
//    RepositoriesListView()
//}

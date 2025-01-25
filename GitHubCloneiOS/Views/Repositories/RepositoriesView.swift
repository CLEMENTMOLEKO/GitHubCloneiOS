//
//  RepositoriesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct RepositoriesView: View {
    @State var viewModel:    RepositoriesVeiwModel

    
    init(userLogin: String?) {
        _viewModel = State(wrappedValue: RepositoriesVeiwModel(userLogin: userLogin))
    }
    
    var body: some View {
        Group {
            switch viewModel.repositoriesState {
            case .loading:
                ProgressView()
            case .success:
                if viewModel.repositories.isEmpty {
                    ContentUnavailableView(
                        "Not repositories found",
                        systemImage: "arrow.triangle.branch"
                    )
                } else {
                    RepositoriesListView(repositories: viewModel.repositories)
                }
            case .failure:
                Text("error getting repos")
            }
        }
        .navigationTitle("Repositories")
        .task {
            await viewModel.getRepositories()
        }
    }
}

#Preview {
    NavigationStack {
        RepositoriesView(userLogin: "CLEMENTMOLEKO")
    }
}

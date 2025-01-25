//
//  StarredRepositoriesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/01/18.
//

import SwiftUI

struct StarredRepositoriesView: View {
    @State var viewModel: StarredRepositoriesViewModel
    
    init(userLogin: String?) {
        _viewModel = State(wrappedValue: StarredRepositoriesViewModel(userLogin: userLogin))
    }
    
    var body: some View {
        List {
            mylist
            starredRepositories
        }
        .listStyle(.grouped)
        .navigationTitle("Starred Repositories")
        .searchable(text: .constant(""))
        .task {
            await viewModel.fetchStarredRepositories()
        }
    }
    
    private var mylist: some View {
        Section{
            //TODO: fetch lists.
            Text("Flutter Libs")
                .badge(1)
        } header: {
            HStack {
                HStack {
                    Image(systemName: "list.bullet")
                    Text("My List")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: {}) {
                    Text("Create List")
                }
            }
        }
    }
    
    private var starredRepositories: some View {
        Section {
            ForEach(viewModel.repositories) { repository in
                RepositoryCardView(repository: repository)
            }
        } header: {
            HStack {
                Image(systemName: "star")
                Text("Starred")
            }
        }
    }
}

#Preview {
    NavigationStack {
        StarredRepositoriesView(userLogin: "clementmoleko")
    }
}

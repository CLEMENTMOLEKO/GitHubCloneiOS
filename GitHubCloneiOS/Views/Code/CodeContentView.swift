//
//  CodeView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/10/06.
//

import SwiftUI

struct CodeContentView: View {
    @StateObject var viewModel: CodeContentViewModel = .init()
    
    let path: String?
    let owner: String
    let repoName: String
    
    init(path: String? = nil, owner: String, repoName: String) {
        self.path = path
        self.owner = owner
        self.repoName = repoName
    }
    
    var body: some View {
        Group {
            switch viewModel.codeState {
            case .loading:
                ProgressView()
            case .success:
                codeContentList
            case .failure:
                Text("Error")
            }
        }
        .searchable(text: $viewModel.searchCodeText, placement: .navigationBarDrawer(displayMode: .always))
        .refreshable {
            await viewModel.getCode(for: repoName, owner: owner, path: path)
        }
//        .toolbar {
//            Menu {
//                if let url = URL(string: "https://github.com/\(owner)/\(repoName)") {
//                    ShareLink(
//                        items: [url]) {
//                            HStack {
//                                Text("Share via..")
//                                Spacer()
//                                Image(systemName: "square.and.arrow.up")
//                            }
//                        }
//                }
//            }
//        }
        .task {
            await viewModel.getCode(for: repoName, owner: owner, path: path)
        }
    }
}

extension CodeContentView {
    public var codeContentList: some View {
        List(viewModel.codeContentList) { codeContent in
            NavigationLink(
                value: HomeNavigationValues.code(
                    path: codeContent.path,
                    owner: owner,
                    repoName: repoName
                )
            ) {
                Label {
                    Text(
                        codeContent.path
                    )
                } icon: {
                    Image(
                        systemName: codeContent.type.icon
                    )
                    //TODO: can't used color
                    .foregroundStyle(.blue.opacity(0.5))
                }
            }
        }
    }
}

#Preview {
    CodeContentView(owner: "CLEMENTMOLEKO", repoName:"GitHubCloneiOS")
}
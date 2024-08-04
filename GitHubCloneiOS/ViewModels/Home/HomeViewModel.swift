//
//  HomeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var gitHubItems: [MyWorkItem] = [
        MyWorkItem(name: "Issues", systemImage: "smallcircle.filled.circle", systemImageColor: .green, value: .issues),
        MyWorkItem(name: "Pull Requests", systemImage: "arrow.triangle.branch", systemImageColor: .blue, value: .pullRequests),
        MyWorkItem(name: "Discussions", systemImage: "bubble.left.and.bubble.right", systemImageColor: .purple, value: .discussions),
        MyWorkItem(name: "Projects", systemImage: "list.bullet.rectangle", systemImageColor: .gray, value: .projects),
        MyWorkItem(name: "Repositories", systemImage: "checkmark.rectangle.stack.fill", systemImageColor: .gray, value: .repositories),
        MyWorkItem(name: "Starred", systemImage: "star", systemImageColor: .yellow, value: .starred),
        MyWorkItem(name: "Organizations", systemImage: "building.2", systemImageColor: .orange, value: .organizations),
    ]
    @Published var selectedGitHubItems = Set<MyWorkItem>() //TODO: these should be saved using swift data. it should persist.
    @Published var searchValue: String = ""
    @Published var isSearchPresented: Bool = false
    
    func move(indices: IndexSet, newOffset: Int) {
        self.gitHubItems.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    //func dele
}

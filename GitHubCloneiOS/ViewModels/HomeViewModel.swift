//
//  HomeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var gitHubItems: [Item] = [
        Item(name: "Issues", systemImage: "smallcircle.filled.circle", systemImageColor: .green),
        Item(name: "Pull Requests", systemImage: "arrow.triangle.branch", systemImageColor: .blue),
        Item(name: "Discussions", systemImage: "bubble.left.and.bubble.right", systemImageColor: .purple),
        Item(name: "Projects", systemImage: "list.bullet.rectangle", systemImageColor: .gray),
        Item(name: "Repositories", systemImage: "checkmark.rectangle.stack.fill", systemImageColor: .gray),
        Item(name: "Starred", systemImage: "star", systemImageColor: .yellow),
        Item(name: "Organizations", systemImage: "building.2", systemImageColor: .orange),
    ]
    @Published var selectedGitHubItems = Set<Item>() //TODO: these should be saved using swift data. it should persist.
    @Published var searchValue: String = ""
    @Published var isSearchPresented: Bool = false
    
    func move(indices: IndexSet, newOffset: Int) {
        self.gitHubItems.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    //func dele
}

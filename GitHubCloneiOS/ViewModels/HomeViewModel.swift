//
//  HomeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

class HomeViewModel: ObservableObject {
    let gitHubItems: [Item] = [
        Item(name: "Issues", systemImage: "smallcircle.filled.circle", systemImageColor: .green),
        Item(name: "Pull Requests", systemImage: "arrow.triangle.branch", systemImageColor: .blue),
        Item(name: "Discussions", systemImage: "bubble.left.and.bubble.right", systemImageColor: .purple),
        Item(name: "Projects", systemImage: "list.bullet.rectangle", systemImageColor: .gray),
        Item(name: "Pull Requests", systemImage: "cable.coaxial", systemImageColor: .blue),
        Item(name: "Pull Requests", systemImage: "cable.coaxial", systemImageColor: .blue),
        Item(name: "Pull Requests", systemImage: "cable.coaxial", systemImageColor: .blue)
    ]
    
    @Published var searchValue: String = ""
    @Published var isSearchPresented: Bool = false
    
}

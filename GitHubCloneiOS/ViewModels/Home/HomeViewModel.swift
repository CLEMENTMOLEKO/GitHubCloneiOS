//
//  HomeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
   let shortcuts = [
        ShortCut(icon: "bolt", color: .gray ),
        ShortCut(icon: "smallcircle.filled.circle", color: .green),
        ShortCut(icon: "arrow.triangle.branch", color: .blue),
        ShortCut(icon: "bubble.left.and.bubble.right", color: .purple),
        ShortCut(icon: "building.2", color: .orange),
        ShortCut(icon: "person.2", color: .red),
        ShortCut(icon: "suitcase", color: .purple),
        ShortCut(icon: "document.badge.plus", color: .gray),
    ] 
    
    //TODO: the below items should be stored with swiftdata, used in myworks view
    @Published var gitHubItems = DevData.githubItems;
    @Published var searchValue: String = ""
    @Published var isSearchPresented: Bool = false
}

struct ShortCut: Identifiable {
    var id: String { icon + color.description}
    let icon: String
    let color: Color
}

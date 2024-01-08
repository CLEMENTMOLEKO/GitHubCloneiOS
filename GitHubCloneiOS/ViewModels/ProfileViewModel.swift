//
//  ProfileViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation
final class ProfileViewModel: ObservableObject {
    let gitHubItems: [Item] = [
        Item(name: "Repositories", systemImage: "checkmark.rectangle.stack.fill", systemImageColor: .gray),
        Item(name: "Starred", systemImage: "star", systemImageColor: .yellow),
        Item(name: "Organizations", systemImage: "building.2", systemImageColor: .orange),
    ]
}

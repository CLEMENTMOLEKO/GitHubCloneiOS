//
//  DevData.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/17.
//

//MARK: DELETE FILE ONCE IMPLIMENTATIONS ARE DONE, DATA HERE IS USED FOR UI BEFORE CONFIGS

import Foundation

struct DevData {
    static let githubItems = [
        MyWorkItem(name: "Issues", systemImage: "smallcircle.filled.circle", systemImageColor: .green, value: .issues),
        MyWorkItem(name: "Pull Requests", systemImage: "arrow.triangle.branch", systemImageColor: .blue, value: .pullRequests),
        MyWorkItem(name: "Discussions", systemImage: "bubble.left.and.bubble.right", systemImageColor: .purple, value: .discussions),
        MyWorkItem(name: "Projects", systemImage: "list.bullet.rectangle", systemImageColor: .gray, value: .projects),
        MyWorkItem(name: "Repositories", systemImage: "checkmark.rectangle.stack.fill", systemImageColor: .gray, value: .repositories),
        MyWorkItem(name: "Starred", systemImage: "star", systemImageColor: .yellow, value: .starred),
        MyWorkItem(name: "Organizations", systemImage: "building.2", systemImageColor: .orange, value: .organizations),
    ]
}



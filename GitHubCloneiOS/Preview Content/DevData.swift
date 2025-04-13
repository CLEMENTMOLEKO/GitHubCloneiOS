//
//  DevData.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/17.
//

//TODO: DELETE FILE ONCE IMPLIMENTATIONS ARE DONE, DATA HERE IS USED FOR UI BEFORE CONFIGS

import Foundation

struct DevData {
    static let githubItems = [
        MyWorkItem(
            title: "Issues",
            systemImage: "smallcircle.filled.circle",
            iconBackgroundColor: .green,
            value: .issues
        ),
        MyWorkItem(
            title: "Pull Requests",
            systemImage: "arrow.triangle.branch",
            iconBackgroundColor: .blue,
            value: .pullRequests
        ),
        MyWorkItem(
            title: "Discussions",
            systemImage: "bubble.left.and.bubble.right",
            iconBackgroundColor: .purple,
            value: .discussions
        ),
        MyWorkItem(
            title: "Projects",
            systemImage: "list.bullet.rectangle",
            iconBackgroundColor: .gray,
            value: .projects
        ),
        MyWorkItem(
            title: "Repositories",
            systemImage: "checkmark.rectangle.stack.fill",
            iconBackgroundColor: .gray,
            value: .repositories()
        ),
        MyWorkItem(
            title: "Starred",
            systemImage: "star",
            iconBackgroundColor: .yellow,
            value: .starred
        ),
        MyWorkItem(
            title: "Organizations",
            systemImage: "building.2",
            iconBackgroundColor: .orange,
            value: .organizations
        ),
    ]
}

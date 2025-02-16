//
//  Issue.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/02/16.
//

import Foundation

// MARK: - Issue
struct Issue: Codable, Identifiable {
    let id: Int
    let nodeID: String
    let url, repositoryURL: String
    let labelsURL: String
    let commentsURL, eventsURL, htmlURL: String
    let number: Int
    let state, title, body: String
    let user: Assignee
    let labels: [IssueLabel]
    let assignee: Assignee
    let assignees: [Assignee]
    let milestone: Milestone
    let locked: Bool
    let activeLockReason: String
    let comments: Int
    let pullRequest: PullRequest
    let closedAt: JSONNull?
    let createdAt, updatedAt: Date
    let repository: Repository
    let authorAssociation: String
}

// MARK: - Assignee
struct Assignee: Codable {
    let login: String
    let id: Int
    let nodeID: String
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    let subscriptionsURL, organizationsURL, reposURL: String
    let eventsURL: String
    let receivedEventsURL: String
    let type: String
    let siteAdmin: Bool
}

// MARK: - Label
struct IssueLabel: Codable {
    let id: Int
    let nodeID: String
    let url: String
    let name, description, color: String
    let labelDefault: Bool
}

// MARK: - Milestone
struct Milestone: Codable {
    let url: String
    let htmlURL: String
    let labelsURL: String
    let id: Int
    let nodeID: String
    let number: Int
    let state, title, description: String
    let creator: Assignee
    let openIssues, closedIssues: Int
    let createdAt, updatedAt, closedAt, dueOn: Date
}

// MARK: - PullRequest
struct PullRequest: Codable {
    let url, htmlURL: String
    let diffURL: String
    let patchURL: String

    enum CodingKeys: String, CodingKey {
        case url
        case htmlURL
        case diffURL
        case patchURL
    }
}

// MARK: - License
struct License: Codable {
    let key, name: String
    let url: String
    let spdxID, nodeID: String
    let htmlURL: String
}

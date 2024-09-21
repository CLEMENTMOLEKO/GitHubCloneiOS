//
//  Commits.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/09/21.
//

import Foundation

// MARK: - Commit
struct Commit: Codable, Identifiable {
    var id: String { sha }
    let url: String
    let sha, nodeId: String
    let htmlUrl, commentsUrl: String
    let commit: CommitDetails
    let author, committer: CommitAuthor
    let parents: [Tree]

    enum CodingKeys: String, CodingKey {
        case url, sha
        case nodeId
        case htmlUrl
        case commentsUrl
        case commit, author, committer, parents
    }
}

// MARK: - CommitAuthor
// TODO: change to Owner?
struct CommitAuthor: Codable {
    let login: String
    let id: Int
    let nodeId: String
    let avatarUrl: String
    let gravatarId: String
    let url, htmlUrl, followersUrl: String
    let followingUrl, gistsUrl, starredUrl: String
    let subscriptionsUrl, organizationsUrl, reposUrl: String
    let eventsUrl: String
    let receivedEventsUrl: String
    let type: String
    let siteAdmin: Bool
}

// MARK: - CommitClass
struct CommitDetails: Codable {
    let url: String
    let author, committer: CommitAuthorDetails
    let message: String
    let tree: Tree
    let commentCount: Int
    let verification: Verification
}

// MARK: - CommitAuthorClass
struct CommitAuthorDetails: Codable {
    let name, email: String
    let date: String
}

// MARK: - Tree
struct Tree: Codable {
    let url: String
    let sha: String
}

// MARK: - Verification
struct Verification: Codable {
    let verified: Bool
    let reason: String
    let signature, payload: String?
}

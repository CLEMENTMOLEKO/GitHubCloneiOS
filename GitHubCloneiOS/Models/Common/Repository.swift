//
//  githubrepository.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/05.
//

import Foundation

// MARK: - Repository
struct Repository: Codable, Identifiable, Hashable {
    static func == (lhs: Repository, rhs: Repository) -> Bool {
        true
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: Int
    let name: String
    let fullName: String?
    let owner: Owner
    let welcomePrivate: Bool
    let nodeID, description: String?
    let fork: Bool
    let url: String
    let htmlURL, archiveURL, assigneesURL,
        blobsURL, branchesURL,
        collaboratorsURL, commentsURL, commitsURL, compareURL,
        contentsURL, contributorsURL, deploymentsURL, downloadsURL, eventsURL,
        forksURL, gitCommitsURL, gitRefsURL, gitTagsURL, gitURL: String?
    let issueCommentURL, issueEventsURL, issuesURL, keysURL: String?
    let labelsURL: String?
    let languagesURL, mergesURL: String?
    let milestonesURL, notificationsURL, pullsURL, releasesURL: String?
    let sshURL: String?
    let stargazersURL: String?
    let statusesURL: String?
    let subscribersURL, subscriptionURL, tagsURL, teamsURL: String?
    let treesURL: String?
    let cloneURL, mirrorURL, svnURL, homepage: String?
    let hooksURL: String?
    let language: String?
    let forksCount, stargazersCount, watchersCount, size: Int?
    let defaultBranch: String?
    let openIssuesCount: Int?
    let isTemplate: Bool?
    let topics: [String]?
    let hasIssues, hasProjects, hasWiki, hasPages: Bool?
    let hasDownloads, hasDiscussions, archived, disabled: Bool?
    let visibility: String?
    let pushedAt, createdAt, updatedAt: String?
    let permissions: Permissions?
    let securityAndAnalysis: SecurityAndAnalysis?
    
    // TODO: remove the below coding keys and set the decoding strategy as snake case.
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case owner
        case welcomePrivate = "private"
        case htmlURL = "html_url"
        case description, fork, url
        case archiveURL = "archive_url"
        case assigneesURL = "assignees_url"
        case blobsURL = "blobs_url"
        case branchesURL = "branches_url"
        case collaboratorsURL = "collaborators_url"
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case compareURL = "compare_url"
        case contentsURL = "contents_url"
        case contributorsURL = "contributors_url"
        case deploymentsURL = "deployments_url"
        case downloadsURL = "downloads_url"
        case eventsURL = "events_url"
        case forksURL = "forks_url"
        case gitCommitsURL = "git_commits_url"
        case gitRefsURL = "git_refs_url"
        case gitTagsURL = "git_tags_url"
        case gitURL = "git_url"
        case issueCommentURL = "issue_comment_url"
        case issueEventsURL = "issue_events_url"
        case issuesURL = "issues_url"
        case keysURL = "keys_url"
        case labelsURL = "labels_url"
        case languagesURL = "languages_url"
        case mergesURL = "merges_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case pullsURL = "pulls_url"
        case releasesURL = "releases_url"
        case sshURL = "ssh_url"
        case stargazersURL = "stargazers_url"
        case statusesURL = "statuses_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case tagsURL = "tags_url"
        case teamsURL = "teams_url"
        case treesURL = "trees_url"
        case cloneURL = "clone_url"
        case mirrorURL = "mirror_url"
        case hooksURL = "hooks_url"
        case svnURL = "svn_url"
        case homepage, language
        case forksCount = "forks_count"
        case stargazersCount = "stargazers_count"
        case watchersCount = "watchers_count"
        case size
        case defaultBranch = "default_branch"
        case openIssuesCount = "open_issues_count"
        case isTemplate = "is_template"
        case topics
        case hasIssues = "has_issues"
        case hasProjects = "has_projects"
        case hasWiki = "has_wiki"
        case hasPages = "has_pages"
        case hasDownloads = "has_downloads"
        case hasDiscussions = "has_discussions"
        case archived, disabled, visibility
        case pushedAt = "pushed_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case permissions
        case securityAndAnalysis = "security_and_analysis"
    }
}


// MARK: - SecurityAndAnalysis
struct SecurityAndAnalysis: Codable {
    let advancedSecurity, secretScanning, secretScanningPushProtection: AdvancedSecurity?

    enum CodingKeys: String, CodingKey {
        case advancedSecurity = "advanced_security"
        case secretScanning = "secret_scanning"
        case secretScanningPushProtection = "secret_scanning_push_protection"
    }
}

// MARK: - AdvancedSecurity
struct AdvancedSecurity: Codable {
    let status: String?
}

//
//  Code.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/24.
//

import Foundation

// MARK: - CodeContent
struct CodeContent: Codable, Identifiable {
    var id: String { sha }
    let name, path, sha: String
    let size: Int
    let url, htmlURL: String
    let gitURL: String
    let downloadURL: String
    let type: ContentType
    let links: Links
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: String
    let git: String
    let html: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case git, html
    }
}

enum ContentType: String, Codable {
    case file, dir
    
    var icon: String {
        switch self {
        case .file: return "file"
        case .dir: return "folder"
        }
    }
}

//
//  APIError.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import Foundation

enum APIError: Error {
    case invalidEndpoint
    case invalidResponse
    case failedToDecode
    case noData
}

//
//  CreateIssueViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/19.
//

import Foundation

@MainActor
final class CreateIssueViewModel: ObservableObject {
    @Published var searchableText: String = ""
}

//
//  HomeNavigationValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/07/13.
//

import SwiftUI

enum HomeNavigationValues: Hashable, View, Identifiable {
    case issues
    case pullRequests
    case discussions
    case projects
    case repositories
    case starred
    case organizations
    
    var id: Self { self }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //TODO: Add and check if overriding equality is needed.
    
    var body: some View {
        switch self {
//        case .issues:
//        case .pullRequests:
//        case .discussions:
//        case .projects:
//        case .repositories:
//        case .starred:
//        case .organizations:
        default:
            Text("Test Home Navigation")
        }
    }
}

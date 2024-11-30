//
//  ProfileNavigationValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/11/30.
//

import Foundation
import SwiftUI

enum ProfileNavigationValues: NavigationDestination {
    var id: Self {self}
    
    case following
    case followers
    case starred
    
    var body: some View {
        switch self {
        case .following:
            Text("Following View")
        case .followers:
            Text("Followers View")
        case .starred:
            Text("Starred View")
        }
    }
}

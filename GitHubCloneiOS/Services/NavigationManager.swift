//
//  NavigationManager.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import Foundation
import SwiftUI


class NavigationManager: ObservableObject {
    @Published var homeRoutes = NavigationPath()
    @Published var profileRoutes = NavigationPath()
    
    func navigate(to destination: any NavigationDestination) {
        switch destination {
        case let homeDestination as HomeNavigationValues:
            homeNavigateTo(homeDestination)
        case let profileDestination as ProfileNavigationValues:
            profileNavigateTo(profileDestination)
        default:
            print("Unsupported navigation type")
        }
    }
    
    private func homeNavigateTo(_ destination: HomeNavigationValues) {
        homeRoutes.append(destination)
    }
    
    private func profileNavigateTo(_ destination: ProfileNavigationValues) {
        profileRoutes.append(destination)
    }
}

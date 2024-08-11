//
//  NavigationManager.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    @Published var routes = NavigationPath()
    
    func navigate(to destination: HomeNavigationValues) {
        routes.append(destination)
    }
}

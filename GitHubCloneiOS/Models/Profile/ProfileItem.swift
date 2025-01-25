//
//  ProfileItem.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct ProfileItem: Item {
    let id = UUID()
    let name: String
    let systemImage: String
    let systemImageColor: Color
    let navigationItem: ProfileNavigationValues
}

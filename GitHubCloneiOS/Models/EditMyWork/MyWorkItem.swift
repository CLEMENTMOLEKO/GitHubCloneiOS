//
//  MyWorkItem.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct MyWorkItem: Item {
    let id = UUID()
    let title: String
    let systemImage: String
    let iconBackgroundColor: Color
    let value: HomeNavigationValues
}

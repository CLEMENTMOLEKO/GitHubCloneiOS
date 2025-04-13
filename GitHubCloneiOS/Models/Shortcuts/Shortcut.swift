//
//  Shortcut.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/13.
//

import Foundation
import SwiftUI

struct Shortcut: Item {
    let id = UUID()
    let title: String
    let systemImage: String
    let myWorkCategory: String
    let iconBackgroundColor: Color
}

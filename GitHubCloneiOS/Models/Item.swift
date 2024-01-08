//
//  Item.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation
import SwiftUI

struct Item: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let systemImage: String
    let systemImageColor: Color
}

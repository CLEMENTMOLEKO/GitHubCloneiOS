//
//  Item.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation
import SwiftUI

protocol Item: Identifiable, Hashable {
    var id : UUID {get}
    var title: String {get}
    var systemImage: String {get}
    var iconBackgroundColor: Color {get}
}

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
    var name: String {get}
    var systemImage: String {get}
    var systemImageColor: Color {get}
}

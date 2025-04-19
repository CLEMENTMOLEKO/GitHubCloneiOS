//
//  ShortcutsViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/13.
//

import Foundation
import Observation

@Observable
final class ShortcutsViewModel {
    var showCreateShortCutView: Bool = false
    var suggestedShortcuts: [Shortcut] = [
        Shortcut(title: "Mentioned", systemImage: "eye",  myWorkCategory: "Issues", iconBackgroundColor: .green),
        Shortcut(title: "Assigned", systemImage: "wrench.adjustable",  myWorkCategory: "Issues", iconBackgroundColor: .red.opacity(0.8)),
        Shortcut(title: "Mentioned", systemImage: "arrow.triangle.branch",  myWorkCategory: "Pull Requests", iconBackgroundColor: .blue.opacity(0.8)),
    ]
}

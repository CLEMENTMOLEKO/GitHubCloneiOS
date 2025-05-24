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
    
    private(set) var selectedShortcuts: [Shortcut] = []
    private(set) var suggestedShortcuts: [Shortcut] = [
        Shortcut(title: "Mentioned", systemImage: "eye",  myWorkCategory: "Issues", iconBackgroundColor: .green),
        Shortcut(title: "Assigned", systemImage: "wrench.adjustable",  myWorkCategory: "Issues", iconBackgroundColor: .red.opacity(0.8)),
        Shortcut(title: "Mentioned", systemImage: "arrow.triangle.branch",  myWorkCategory: "Pull Requests", iconBackgroundColor: .blue.opacity(0.8)),
    ]
    
    func selectShortcut(_ shortcut: Shortcut) {
        selectedShortcuts.append(shortcut)
        suggestedShortcuts.removeAll { $0.id == shortcut.id }
    }
    
    func deleteShortcut(_ shortcut: Shortcut) {
        suggestedShortcuts.append(shortcut)
        selectedShortcuts.removeAll { $0.id == shortcut.id }
    }
    
    func deleteShortcut(at index: Int) {
        let removedShortcut = selectedShortcuts.remove(at: index)
        suggestedShortcuts.append(removedShortcut)
    }
    
    func onMove(_ indexSet: IndexSet, newOffset: Int) {
        selectedShortcuts.move(fromOffsets: indexSet, toOffset: newOffset)
    }
}

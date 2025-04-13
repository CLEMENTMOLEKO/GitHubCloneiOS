//
//  ShortcutsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/12.
//

import SwiftUI

struct ShortcutsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: ShortcutsViewModel = .init()
    
    var body: some View {
        List {
            Section {
                Button("Create New Shortcut", systemImage: "plus") {
                    
                }
            }
            
            Section {
                ForEach(viewModel.suggestedShortcuts) { shortcut in
                    ListRowItem(
                        iconBackground: shortcut.iconBackgroundColor.opacity(0.4),
                        iconName: shortcut.systemImage,
                        title: shortcut.title,
                        subtitle: shortcut.myWorkCategory,
                        iconColor: shortcut.iconBackgroundColor
                    )
                }
                
            } header: {
                Text("Suggested Shortcuts")
            }
        }
        .navigationTitle("Shortcuts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                   dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                   dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ShortcutsView()
    }
}

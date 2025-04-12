//
//  ShortcutsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/12.
//

import SwiftUI

struct ShortcutsView: View {
    var body: some View {
        List {
            Section {
                Button("Create New Shortcut", systemImage: "plus") {
                    
                }
            }
            
            Section {
                HStack {
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
                    
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    
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

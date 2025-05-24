//
//  CreateAShortCutView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/19.
//

import SwiftUI

struct CreateShortCutView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List {
            Section {
                ListRowItem(
                    iconBackground: Color.gray.opacity(0.4),
                    iconName: "bolt",
                    title: "Title",
                    subtitle: "Issues",
                    iconColor: Color.gray.opacity(0.3)
                )
            }
            
            Section {
                Picker("Scope", selection: .constant("All Repositories")) {
                    Text("All Repositories").tag("All Repositories")
                        .foregroundStyle(.blue)
                    Text("Choose Repository").tag("Choose Repository")
                }
                
                Picker("Type", selection: .constant("Issues")) {
                    Text("Issues").tag("Issues")
                    Text("Pull Requests").tag("Pull Requests")
                    Text("Discussions").tag("Discussions")
                }
                
            }
        }
        .navigationTitle("Create Shortcut")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
     CreateShortCutView()
        .preferredColorScheme(.dark)   
    }
}

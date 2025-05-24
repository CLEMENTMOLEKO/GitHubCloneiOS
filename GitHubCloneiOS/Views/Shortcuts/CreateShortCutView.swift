//
//  CreateAShortCutView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/19.
//

import SwiftUI

struct CreateShortCutView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var status: Status = .open
    @State private var author: Author = .me
    
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
                
                filters
                    .frame(maxWidth: .infinity)
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
    
    private var filters: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                MenuFilter(options: Status.allCases, selection: $status)
                MenuFilter(options: Author.allCases, selection: $author)
                MenuFilter(options: Author.allCases, selection: $author)
                MenuFilter(options: Author.allCases, selection: $author)
            }
        }
        .scrollIndicators(.hidden)
    }
}

enum Status: String, CaseIterable, Option {
    case open  = "Open"
    case closed = "Closed"
    
    var text: String {
        rawValue
    }
    
    var id: UUID {
        UUID()
    }
}

enum Author: String, CaseIterable, Option {
    case me      = "Created by me"
    case anyone  = "Anyone"
   
    var text: String {
        rawValue
    }
    
    var id: UUID {
        UUID()
    }
}

protocol Option: Identifiable {
    var id: UUID { get }
    var text: String { get }
}

#Preview {
    NavigationStack {
        CreateShortCutView()
            .preferredColorScheme(.dark)
    }
}

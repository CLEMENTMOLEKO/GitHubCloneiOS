//
//  CreateAShortCutView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/19.
//

import SwiftUI

struct CreateShortCutView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var status: Status = .Open
    @State private var author: Author = .CreatedByMe
    @State private var access: Access = .ShowAll
    
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
                MenuFilter(options: Access.allCases, selection: $access)
                MenuFilterLabel(text: "Organization")
                    .onTapGesture {
                        //TODO: show org sheet.
                    }
                MenuFilterLabel(text: "Repository")
                    .onTapGesture {
                        //TODO: show repository list sheet.
                    }
                Divider().frame(width: 1)
                MenuFilterLabel(text: "Sort:(SortValue)")
                    .onTapGesture {
                        //TODO: show sort sheet.
                    }
            }
        }
        .scrollIndicators(.hidden)
    }
}

enum Status: String, CaseIterable, Option {
    case Open
    case Closed
    case All
    
    var text: String {
        rawValue
    }
    
    var id: UUID {
        UUID()
    }
}

enum Author: String, CaseIterable, Option {
    case CreatedByMe        = "Created by me"
    case AssignedToMe       = "Assigned to me"
    case MentionsMe         = "Mentions me"
    case Involed            = "Involved"
    
    
    var text: String {
        rawValue
    }
    
    var id: UUID {
        UUID()
    }
}

enum Access: String, CaseIterable, Option {
    case ShowAll                    = "Show all"
    case PublicRepository           = "Public repositories only"
    case PrivateRepositoriesOnly    = "Mentions me"
    
    var text: String {
        switch self {
        case .ShowAll:
            return "Visibility"
        case .PublicRepository, .PrivateRepositoriesOnly:
            return rawValue
        }
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

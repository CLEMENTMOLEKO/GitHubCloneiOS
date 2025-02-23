//
//  IssuesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/01/18.
//

import SwiftUI

// filter enums
enum OpenState: String, CaseIterable {
    case open = "Open"
    case closed = "Closed"
    case all = "All"
}
enum CreatedBy: String, CaseIterable {
    case me = "Created by me"
    case anyone = "Created by anyone"
}
enum Visibility: String, CaseIterable {
    case `public` = "Public"
    case `private` = "Private"
    case all = "All"
}
enum Organization: String, CaseIterable {
    case orgA = "Org A"
    case orgB = "Org B"
    case all = "All"
}

struct IssuesView: View {
    @State private var viewModel: IssuesViewModel = .init()
    
    init() {
        //Remove bottom border on the topbar so filters look embedded on the topbar.
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(viewModel.issues) { issue in
                        HStack {
                            Text(issue.title)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemGroupedBackground))
                    }
                    .listStyle(.grouped)
                } header: {
                    PinnedHeader()
                }
            }
            
        }
        .listStyle(.plain)
        .navigationTitle("Issues")
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search"
        )
        .environment(viewModel)
    }
}

struct FilterRow: View {
    @Environment(IssuesViewModel.self) var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                CustomMenuPicker(
                    label: "Open",
                    selection: $viewModel.selectedOpen,
                    allCases: OpenState.allCases
                )
                
                CustomMenuPicker(
                    label: "Created by me",
                    selection: $viewModel.selectedCreator,
                    allCases: CreatedBy.allCases
                )
                
                CustomMenuPicker(
                    label: "Visibility",
                    selection: $viewModel.selectedVisibility,
                    allCases: Visibility.allCases
                )
                
                CustomMenuPicker(
                    label: "Organization",
                    selection: $viewModel.selectedOrg,
                    allCases: Organization.allCases
                )
            }
            .padding(8)
        }
    }
}

#Preview {
    NavigationStack {
        IssuesView()
    }
    .preferredColorScheme(.dark)
}

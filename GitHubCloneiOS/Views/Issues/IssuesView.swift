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
    // TODO: move states to a view model.
    @State private var searchText = ""
    
    private let issues = [
        "Edit mode toggles twice",
        "Some random bug in UI",
        "Closed bug: login issue",
        "Open bug: layout glitch"
    ]
    
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
                    ForEach(issues, id: \.self) { issue in
                        HStack {
                            Text(issue)
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
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search"
        )
    }
}

struct FilterRow: View {
    @Binding var selectedOpen: OpenState
    @Binding var selectedCreator: CreatedBy
    @Binding var selectedVisibility: Visibility
    @Binding var selectedOrg: Organization
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                CustomMenuPicker(
                    label: "Open",
                    selection: $selectedOpen,
                    allCases: OpenState.allCases
                )
                
                CustomMenuPicker(
                    label: "Created by me",
                    selection: $selectedCreator,
                    allCases: CreatedBy.allCases
                )
                
                CustomMenuPicker(
                    label: "Visibility",
                    selection: $selectedVisibility,
                    allCases: Visibility.allCases
                )
                
                CustomMenuPicker(
                    label: "Organization",
                    selection: $selectedOrg,
                    allCases: Organization.allCases
                )
            }
            .padding(8)
        }
    }
}

struct CustomMenuPicker<T: Hashable & RawRepresentable & CaseIterable>: View
where T.RawValue == String, T.AllCases : RandomAccessCollection {
    let label: String
    @Binding var selection: T
    let allCases: T.AllCases
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(allCases, id: \.self) { value in
                Text(value.rawValue).tag(value)
            }
        } label: {
            HStack(spacing: 4) {
                Text(selection.rawValue)
                    .font(.caption)
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .semibold))
            }
            .font(.callout)
        }
        .pickerStyle(.menu)
        .background(Capsule().fill(Color(uiColor: .secondarySystemFill)))
    }
}

struct PinnedHeader: View {
    @State private var yOffset: CGFloat = 8

    @State private var selectedOpen = OpenState.open
    @State private var selectedCreator = CreatedBy.me
    @State private var selectedVisibility = Visibility.all
    @State private var selectedOrg = Organization.all

    var body: some View {
        FilterRow(
            selectedOpen: $selectedOpen,
            selectedCreator: $selectedCreator,
            selectedVisibility: $selectedVisibility,
            selectedOrg: $selectedOrg
        )
        .background(
            yOffset < 153 ? Rectangle().fill(.bar).opacity(1) : Rectangle().fill(.bar).opacity(0)
        )
        .background(
            //Empty geometry reader used to find out filter row position.
            GeometryReader { proxy in
                //TODO: why is preference change firing once even when we scroll? geometry reader is not updating. always zero.
                Rectangle()
                    .fill(.clear)
                    .preference(
                        key: HeaderOffsetPreferenceKey.self,
                        value: proxy.frame(in: .global).minY
                    )
            }
        )
        .onPreferenceChange(HeaderOffsetPreferenceKey.self, perform: { value in
            yOffset = value
        })
    }
}

struct HeaderOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

#Preview {
    NavigationStack {
        IssuesView()
    }
    .preferredColorScheme(.dark)
}

//
//  FilteredSearchView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/02/15.
//

import SwiftUI

protocol ListItem: Identifiable {
    var id: UUID { get }
    var name: String { get }
}

struct FilteredSearchView<T: ListItem>: View {
    let listItems: [T]
    let title: String
    
    @State var searchText: String = ""
    
    init(listItems: [T], title: String) {
        self.listItems = listItems
        self.title = title
        
        //Remove bottom border on the topbar so filters look embedded on the topbar.
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: .sectionHeaders) {
                Section {
                    ForEach(listItems) { listItem in
                        HStack {
                            Text(listItem.name)
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
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search"
        )
    }
}

#Preview {
//    FilteredSearchView(listItems: [], title: "Fitered Search View")
}

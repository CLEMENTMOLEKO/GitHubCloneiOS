//
//  HomeNavigationSheetValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/07/13.
//

import SwiftUI

enum HomeNavigationSheeValues: Identifiable, Hashable, View {
    //Sections
    case myWork
    case favorites
    case shortcuts
    case recents
    //Functionality
    case addRepository
    
    var id: Self { self }
    
    var body: some View {
        switch self {
        case .myWork:
            EditMyWorksView()
        case .favorites:
            FavoritesView()
        case .shortcuts:
            ShortcutsView()
        case .recents:
            Text("Recents View")
        case .addRepository:
            Text("Add Repository Sheet")
        }
    }
}

//
//  ProfileNavigationSheetValues.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/14.
//

import SwiftUI

enum ProfileNavigationSheeValues: Identifiable, Hashable, View {
    //Sections
    case status
    
    var id: Self { self }
    
    var body: some View {
        switch self {
        case .status:
            EditStatusView()
        }
    }
}

//
//  HomeViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import Foundation

class HomeViewModel: ObservableObject {
    //TODO: the below items should be stored with swiftdata, used in myworks view
    @Published var gitHubItems = DevData.githubItems;
    @Published var searchValue: String = ""
    @Published var isSearchPresented: Bool = false
}

//
//  EditMyWorksViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/07/13.
//
import Foundation

class EditMyWorksViewModel: ObservableObject {

    @Published var gitHubItems = DevData.githubItems
    @Published var selectedGitHubItems = Set<MyWorkItem>() //TODO: these should be saved using swift data. it should persist.
    
    func move(indeces: IndexSet, newOffset: Int) {
        //TODO: move mywork items stored in swift data.
    }
}

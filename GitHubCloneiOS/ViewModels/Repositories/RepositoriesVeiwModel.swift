//
//  RepositoriesVeiwModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import Foundation

class RepositoriesVeiwModel: ObservableObject {
    @Published var repositories = [Repository]()
}

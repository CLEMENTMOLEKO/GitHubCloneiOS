//
//  RepositoryDetailsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import SwiftUI

struct RepositoryDetailsView: View {
    let ownerName: String
    let repoName: String
    
    @StateObject var viewModel: RepositoryDetailsViewModel = .init()
    
    var body: some View {
        Text("\(ownerName):\(repoName)")
    }
}

#Preview {
    RepositoryDetailsView(ownerName: "ClementMoleko", repoName: "GitHubCloneiOS")
}

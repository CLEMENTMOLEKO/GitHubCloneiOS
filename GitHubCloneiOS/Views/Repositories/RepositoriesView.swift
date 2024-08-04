//
//  RepositoriesView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct RepositoriesView: View {
    @StateObject var viewModel = RepositoriesVeiwModel();
    
    var body: some View {
        List(viewModel.repositories) { repository in
            VStack {
                HStack {
                }
            }
        }
    }
}

#Preview {
    RepositoriesView()
}

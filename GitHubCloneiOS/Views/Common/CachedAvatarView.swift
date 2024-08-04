//
//  CachedAvatar.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

struct CachedAvatarView: View {
    let imageUrl: String
    
    @StateObject var viewModel: CachedAvatarViewModel
    
    internal init(imageKey: String, imageUrl: String) {
        self._viewModel = StateObject(wrappedValue: CachedAvatarViewModel(imageKey: imageKey))
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        Circle()
            .overlay {
                switch viewModel.imageState {
                case .loading:
                    ProgressView()
                case .failure:
                    Image(systemName: "network.slash")
                case .success:
                    if let image = viewModel.uiImage {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .clipShape(Circle())
                    }
                }
            }
            .clipped()
            .clipShape(Circle())
            .task {
                await viewModel.getImage(from: imageUrl)
            }
    }
}

#Preview {
    CachedAvatarView(imageKey: "test", imageUrl: "test" )
}

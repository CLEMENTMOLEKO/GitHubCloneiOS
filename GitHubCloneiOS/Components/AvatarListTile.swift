//
//  AvatarListTile.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/19.
//

import SwiftUI

struct AvatarListTile: View {
    var showAddImageCirlce: Bool = false
    let avatarUrl: String?
    let title: String
    let subtitle: String
    
    var body: some View {
        HStack(spacing: 12) {
            if showAddImageCirlce {
                Image(systemName: "plus.circle.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.green)
            }
            AsyncImage(url: URL(string: avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(.gray)
            }
            .frame(width: 30)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(subtitle)
                    .font(.headline)
            }
        }
    }
}

#Preview {
    AvatarListTile(avatarUrl: "https://picsum.photos/200", title: "CLEMENTMOLEKO", subtitle: "BESTREPO")
}

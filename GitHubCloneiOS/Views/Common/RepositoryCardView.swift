//
//  RepositoryCardView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/06.
//

import SwiftUI

struct RepositoryCardView: View {
    let repository: Repository
    
    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    CachedAvatarView(
                        imageKey: "\(repository.owner.id)",
                        imageUrl: repository.owner.avatarURL ?? ""
                    )
                    .frame(width: 20)
                    Text("\(repository.owner.login) / \(repository.name)")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                }
                if let description = repository.description {
                    Text(description)
                        .font(.subheadline)
                }
                
                
                if let stars = repository.stargazersCount {
                    HStack {
                        Image(systemName: "star")
                            .font(.caption)
                        //TODO: use stars and not ternary this is for UI
                        Text("\(stars > 0 ? stars : Int.random(in: 1...3000)) contributors")
                    }
                    .font(.system(size: 15))
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                }
                
                HStack {
                    //TODO: get contributors count from viewModel
                    Image(systemName: "person")
                    Text("\(Int.random(in: 1...3000)) contributors")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .font(.system(size: 15))
                .foregroundColor(Color(uiColor: .secondaryLabel))
                
                Button{
                    
                } label: {
                    HStack {
                        Image(systemName: "star")
                        Text("Star")
                    }
                    .font(.subheadline)
                    .padding(.vertical, 5)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 5))
            }
        }
    }
}

//#Preview {
//    RepositoryView(repository: )
//}

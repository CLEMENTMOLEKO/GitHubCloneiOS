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
        List {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Circle()
                        .frame(width: 25)
                    Text("CLEMENT MOLEKO")
                    Spacer()
                }
                Text("GithubCloneiOs")
                    .font(.title)
                    .fontWeight(.bold)
                HStack(spacing: 4) {
                    Image(systemName: "42.circle")
                    Text("Private")
                }
                .font(.caption)
                HStack(spacing: 12) {
                    HStack(spacing: 4){
                        Image(systemName: "star")
                        Text("\(Text("1k").fontWeight(.semibold)) Stars")
                    }
                    .font(.caption)
                   
                    HStack(spacing: 4) {
                        Image(systemName: "star")
                        Text("\(Text("21").fontWeight(.semibold)) Forks")
                    }
                    .font(.caption)
                }
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(uiColor: .secondarySystemFill))
                        .frame(width: 50)
                        .overlay {
                            Image(systemName: "star")
                        }
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(uiColor: .secondarySystemFill))
                        .overlay {
                            HStack {
                                Image(systemName: "plus")
                                Text("Add to list")
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 5)
                        .fill(Color(uiColor: .secondarySystemFill))
                        .frame(width: 50)
                        .overlay {
                            Image(systemName: "bell")
                        }
                }
                .frame(height: 45)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            
            Section {
                ForEach(DevData.githubItems){ item in
                    //TODO: this should be a component it's used everywhere (profile view, explore view)
                    NavigationLink(value: item.value) {
                        HStack {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(item.systemImageColor)
                                .frame(width: 35, height: 35)
                                .overlay{
                                    Image(systemName: item.systemImage)
                                        .font(.system(size: CGFloat(15)))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                                
                            Text(item.name)
                        }
                        .frame(height: 37) //Hot fix.
                    }
                }
            }
        }
        .listStyle(.grouped)
        .toolbar {
            ToolbarItemGroup {
                Button {
                } label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RepositoryDetailsView(ownerName: "ClementMoleko", repoName: "GitHubCloneiOS")
    }
}

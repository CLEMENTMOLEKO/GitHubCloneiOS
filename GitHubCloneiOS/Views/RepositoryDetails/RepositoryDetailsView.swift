//
//  RepositoryDetailsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import SwiftUI

struct RepositoryDetailsView: View {
    let repository: Repository
    
    @State var isExpanded = false
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    CachedAvatarView(
                        imageKey: "\(repository.owner.id)",
                        imageUrl: repository.owner.avatarURL ?? ""
                    )
                    .frame(width: 25)
                    Text(repository.owner.login)
                    Spacer()
                }
                Text(repository.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                if repository.welcomePrivate {
                    HStack(spacing: 4) {
                        Image(systemName: "lock")
                        Text("Private")
                    }
                    .font(.callout)
                }
                
                HStack(spacing: 12) {
                    HStack(spacing: 4){
                        Image(systemName: "star")
                        Text("\(Text("\(repository.stargazersCount ?? 0)").fontWeight(.semibold)) Stars")
                    }
                    .font(.callout)
                   
                    HStack(spacing: 4) {
                        Image(systemName: "star")
                        Text("\(Text("\(repository.forksCount ?? 0)").fontWeight(.semibold)) Forks")
                    }
                    .font(.callout)
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
                ForEach(Array(DevData.githubItems.prefix(upTo: 3))){ item in
                    NavigationLink(value: item.value) {
                        ListRowItem(
                            iconBackground: item.iconBackgroundColor,
                            iconName: item.systemImage,
                            title: item.title
                        )
                    }
                }
                DisclosureGroup(isExpanded: $isExpanded) {
                    ForEach(Array(DevData.githubItems.suffix(from: 3))){ item in
                        NavigationLink(value: item.value) {
                            ListRowItem(
                                iconBackground: item.iconBackgroundColor,
                                iconName: item.systemImage,
                                title: item.title
                            )
                        }
                    }
                } label: {
                    ListRowItem(
                        iconBackground: Color(uiColor: .systemFill),
                        iconName: "ellipsis",
                        title: isExpanded ? "Less" : "More"
                    )
                }
            }
            
            Section {
                NavigationLink(
                    value: HomeNavigationValues.code(
                        owner: repository.owner.login,
                        repoName: repository.name
                    )
                ){
                    ListRowItem(
                        iconBackground: Color(uiColor: .systemFill),
                        iconName: "ellipsis.curlybraces",
                        title: "Code"
                    )
                }
                
                NavigationLink(
                    value: HomeNavigationValues.commits(
                        owner: repository.owner.login,
                        repoName: repository.name
                    )
                ){
                    ListRowItem(
                        iconBackground: Color(uiColor: .systemFill),
                        iconName: "arrowshape.right.circle",
                        title: "Commits"
                    )
                    .badge(10)
                }
            } header: {
                LabeledContent {
                    Button("Change branch") {
                        //
                    }
                } label: {
                    Label(
                        title: { Text("master") },
                        icon: { Image(systemName: "arrow.triangle.branch") }
                    )
                }
            }
            .headerProminence(.increased)
            
            Section {
                MarkDownView(markDownUrl: "https://api.github.com/repos/clementmoleko/\(repository.name)/contents/README.md")
            } header: {
                LabeledContent {
                    Button("Edit") {
                        //
                    }
                } label: {
                    Label(
                        title: { Text("README.md") },
                        icon: { Image(systemName: "info.circle") }
                    )
                }
            }
            .headerProminence(.increased)
        }
        .listStyle(.grouped)
        .toolbar {
            ToolbarItemGroup {
                Button {
                } label: {
                    Image(systemName: "plus.circle")
                        .imageScale(.large)
                }
            }
            
            ToolbarItem {
                Menu {
                    Section {
                        Button(action: {
                        }) {
                            HStack {
                                Text("Share via..")
                                Spacer()
                                Image(systemName: "square.and.arrow.up")
                            }
                        }
                    }
                    
                    Section {
                        Button(action: {
                        }) {
                            LabeledContent("Edit description") {
                                Image(systemName: "pencil")
                            }
                        }
                    }
                    
                    Section {
                        Button(action: {
                        }) {
                            LabeledContent("Report") {
                                Image(systemName: "exclamationmark.bubble")
                            }
                        }
                        
                        Button(action: {
                        }) {
                            LabeledContent("Add to favorites") {
                                Image(systemName: "plus")
                            }
                        }
                    }
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
    }
}

//TODO: Create sample data for previews
//#Preview {
//    NavigationStack {
//        RepositoryDetailsView(.)
//    }
//    .preferredColorScheme(.dark)
//}

//
//  RepositoryDetailsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/11.
//

import SwiftUI

struct RepositoryDetailsView: View {
    let repository: Repository
    
    @StateObject var viewModel: RepositoryDetailsViewModel = .init()
    @State var isExpanded = false
    
    var body: some View {
        List {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Circle()
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
                ForEach(getGitHubItemsInRange(..<3)){ item in
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
                DisclosureGroup(isExpanded: $isExpanded) {
                    ForEach(getGitHubItemsInRange(3...)){ item in
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
                } label: {
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 35, height: 35)
                            .overlay{
                                Image(systemName: "ellipsis")
                                    .font(.system(size: CGFloat(15)))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        Text(isExpanded ? "Less" : "More")
                    }
                    .frame(height: 37) //Hot fix.
                }
            }
            
            Section {
                NavigationLink(destination: Text("Repos Code")) {
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 35, height: 35)
                            .overlay{
                                Image(systemName: "ellipsis.curlybraces")
                                    .font(.system(size: CGFloat(15)))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        Text("Code")
                    }
                    .frame(height: 37) //Hot fix.
                }
                
                NavigationLink(destination: Text("Commits")) {
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color(uiColor: .systemFill))
                            .frame(width: 35, height: 35)
                            .overlay{
                                Image(systemName: "arrowshape.right.circle")
                                    .font(.system(size: CGFloat(15)))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            
                        Text("Commits")
                    }
                    .badge(10) //TODO: get commit counts, it's ridiculous that is not on the json object
                    .frame(height: 37) //Hot fix.
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
                Text("This is the read me for my perfect repo. I'm literally cloning chatGPT and Claude. Can't touch me.")
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

private func getGitHubItemsInRange<R: RangeExpression>(_ range: R) -> [MyWorkItem] where R.Bound == Int {
    let fullRange = range.relative(to: 0..<DevData.githubItems.count)
    let startIndex = fullRange.lowerBound
    let endIndex = fullRange.upperBound

    guard startIndex < endIndex else {
        return []
    }

    return Array(DevData.githubItems[fullRange])
}

//TODO: Create sample data for previews
//#Preview {
//    NavigationStack {
//        RepositoryDetailsView(.)
//    }
//    .preferredColorScheme(.dark)
//}

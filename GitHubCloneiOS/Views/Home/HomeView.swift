//
//  HomeView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = .init()
    @State var currentHomeSheet: HomeNavigationSheeValues?
    var body: some View {
        List {
            myWorks
            favorites
            shortcuts
            recents
        }
        .navigationTitle("Home")
        .searchable(text: $vm.searchValue, isPresented: $vm.isSearchPresented, prompt: Text("Search GitHub"))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    currentHomeSheet = .addRepository
                } label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        .sheet(item: $currentHomeSheet) { $0 }
    }
}

private extension HomeView {
    var myWorks: some View {
        Section {
            ForEach(vm.gitHubItems){ item in
                //TODO: this should be a component it's used everywhere (profile view, explore view)
                NavigationLink(value: item.value) {
                    ListRowItem(
                        iconBackground: item.systemImageColor,
                        iconName: item.systemImage,
                        name: item.name
                    )
                }
            }
        } header: {
            HStack {
                Text("My Work")
                Spacer()
                Button {
                    currentHomeSheet = .myWork
                } label: {
                    Image(systemName: "ellipsis")
                }

            }
        }
        .headerProminence(.increased)
    }
    
    var favorites: some View {
        Section {
            VStack {
                Text("Add favorite repositories here to have quick access at any time, without having to search")
                    .multilineTextAlignment(.center)
                Button {
                    currentHomeSheet = .favorites
                } label: {
                    Text("Add Favorites")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 5))

            }
        } header: {
            HStack {
                Text("Favorites")
                Spacer()
                Button {
                    currentHomeSheet = .favorites
                } label: {
                    Image(systemName: "ellipsis")
                }

            }
        }
        .headerProminence(.increased)
    }
    
    var shortcuts: some View {
        Section {
            VStack {
                HStack(spacing: -5) {
                    ForEach(vm.shortcuts){ shortcut in
                       ShortcutCircle(shortcut: shortcut)
                    }
                }
                
                Button {
                    //TODO: Add favorites
                } label: {
                    Text("Get started")
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle(radius: 5))
            }
        } header: {
            HStack{
                Text("Shortcuts")
                Spacer()
                Button {
                    currentHomeSheet = .shortcuts
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .headerProminence(.increased)
    }
    
    var recents: some View {
        Section {
            Text("Issues and Pull Requests that you've interacted with recently will appear here.")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
        } header: {
            HStack{
                Text("Recents")
                Spacer()
                Button {
                    currentHomeSheet = .recents
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .headerProminence(.increased)
    }
}

#Preview {
    HomeView()
}

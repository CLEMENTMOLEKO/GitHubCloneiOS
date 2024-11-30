//
//  GitHubCloneiOSApp.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

@main
struct GithubCloneApp: App {
    @StateObject var navigationManager = NavigationManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .navigationStackWithDestination(
                        for: HomeNavigationValues.self,
                        path: $navigationManager.homeRoutes
                    )
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }

                ExploreView()
                    .tabItem {
                        Image(systemName: "flashlight.on.fill")
                        Text("Explore")
                    }

                ProfileView()
                    .navigationStackWithDestination(
                        for: ProfileNavigationValues.self,
                        path: $navigationManager.profileRoutes
                    )
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                        //TODO: how to render below async image?
                        //let url = URL(string: "https://picsum.photos/200")
                        //                        AsyncImage(url: url) { image in
                        //                            image
                        //                                .resizable()
                        //                                .aspectRatio(contentMode: .fit)
                        //                                .clipShape(Circle())
                        //                                .frame(width: 20, height: 20)
                        //                        } placeholder: {
                        //                            Circle()
                        //                                .fill(.gray)
                        //                                .overlay(
                        //                                    Image(systemName: "person")
                        //                                )
                        //                        }
                        //                        .frame(maxWidth: 20, maxHeight: 20)
                    }

            }
            .environmentObject(navigationManager)
        }
    }
}

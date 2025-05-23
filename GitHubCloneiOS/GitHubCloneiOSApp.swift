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
    @AppStorage("tab_selection") var tabSelection: TabSelection = .home
    @AppStorage("current_user_login") var currentUserLogin: String?
    
    init() {
        //TODO: get this from user onboarding/login.
        UserDefaults.standard.set("clementmoleko", forKey: "current_user_login")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $tabSelection) {
                HomeView()
                    .navigationStackWithDestination(
                        for: HomeNavigationValues.self,
                        path: $navigationManager.homeRoutes
                    )
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(TabSelection.home)
                
                NotificationsView()
                    .tabItem {
                        Image(systemName: "bell")
                        Text("Notifications")
                    }
                    .tag(TabSelection.notifications)

                ExploreView()
                    .navigationStackWithDestination(
                        for: HomeNavigationValues.self,
                        path: $navigationManager.homeRoutes
                    )
                    .tabItem {
                        Image(systemName: "flashlight.on.fill")
                        Text("Explore")
                    }
                    .tag(TabSelection.explore)

                ProfileView(userLogin: currentUserLogin!)
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
                    .tag(TabSelection.profile)

            }
            .environmentObject(navigationManager)
        }
    }
    
    enum TabSelection : String, Codable {
        case home
        case notifications
        case explore
        case profile
    }
}

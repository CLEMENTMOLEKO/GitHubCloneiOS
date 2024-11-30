//
//  ProfileView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var vm: ProfileViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List {
                switch vm.userState {
                case .loading:
                    ProgressView()
                case .success:
                    Group {
                        detailSection
                        itemsSection
                        popularSection
                    }
                case .failure:
                    Text("Error Occured")
                }
            }
            .listStyle(.grouped)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    //TODO: url below should be from user defaults or swiftdata/core data for the user who logged in currently.
                    if let htmlUrl = URL(string: vm.user?.htmlUrl ?? "") {
                        ShareLink(item: htmlUrl) {
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
            }
            .task {
                await vm.getUser()
            }
        }
    }
}

private extension ProfileView {
    
    private var detailSection: some View {
        Section {
            HStack {
                CachedAvatarView(imageKey: vm.user?.avatarUrl ?? "", imageUrl: vm.user?.avatarUrl ?? "")
                    .frame(width: 80)
                Text(vm.user?.login.uppercased() ?? "")
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30){
                Text(vm.user?.bio ?? "")
                HStack{
                    Group {
                        Image(systemName: "person.2")
                        Text("\(vm.user?.followers ?? 0) followers")
                    }
                    .onTapGesture {
                        navigationManager.navigate(to: ProfileNavigationValues.followers)
                    }
                    
                    Group {
                        Image(systemName: "person")
                        Text("\(vm.user?.following ?? 0) following")
                    }
                    .onTapGesture {
                        navigationManager.navigate(to: ProfileNavigationValues.following)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var itemsSection: some View {
        Section {
            ForEach(vm.gitHubItems){ item in
                NavigationLink(value: item) {
                    ListRowItem(
                        iconBackground: item.systemImageColor,
                        iconName: item.systemImage,
                        name: item.name
                    )
                }
            }
        }
    }
    
    private var popularSection: some View {
        Section {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<10, id: \.self) { _ in
                        popularRepository
                            .frame(width: UIScreen.main.bounds.width * 0.80)
                    }
                }
                
            }
            .scrollIndicators(.hidden)
        } header: {
            HStack {
                Image(systemName: "star")
                Text("Popular")
            }
            .font(.subheadline)
        }
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
    
    private var popularRepository: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                CachedAvatarView(
                    imageKey: vm.user?.avatarUrl ?? "",
                    imageUrl: vm.user?.avatarUrl ?? ""
                )
                .frame(width: 30)
                
                Text(vm.user?.login.uppercased() ?? "")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("repository name placeholder") //TODO: we need to get popular repos for the logged in user.
                .font(.headline)
            Text("This is the placeholder for the popular repository shown on the profile")
                .lineLimit(2)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ProfileView()
}

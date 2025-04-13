//
//  ProfileView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    @State var currentProfileSheet: ProfileNavigationSheeValues? = nil
    @StateObject var vm: ProfileViewModel
   
    init(userLogin: String) {
        _vm = StateObject(wrappedValue: ProfileViewModel(userLogin: userLogin))
    }
    
    var body: some View {
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
                Text("Error Occured Getting Profile.")
            }
        }
        .listStyle(.grouped)
        .toolbar{
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button{
                    
                } label: {
                    Image(systemName: "gearshape")
                }
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
        .sheet(item: $currentProfileSheet) {$0}
    }
}

private extension ProfileView {
    
    private var detailSection: some View {
        Section {
            HStack {
                CachedAvatarView(
                    imageKey: vm.user?.avatarUrl ?? "",
                    imageUrl: vm.user?.avatarUrl ?? ""
                )
                .frame(width: 50)
                Text(vm.user?.login.uppercased() ?? "")
                Spacer()
            }
            
            HStack {
                Image(systemName: "face.smiling.inverse")
                Text("Set your status")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Image(systemName: "pencil")
            }
            .padding()
            .background(Color(uiColor: .secondarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .pressable {
                currentProfileSheet = .status
            }
            
            Text(vm.user?.bio ?? "")
            
            HStack {
                Group {
                    Image(systemName: "person.2")
                    Text("\(vm.user?.followers ?? 0) followers")
                }
                .onTapGesture {
                    navigationManager.navigate(
                        to: ProfileNavigationValues.followers(
                            userLogin: vm.user?.login
                        )
                    )
                }
                
                Group {
                    Image(systemName: "person")
                    Text("\(vm.user?.following ?? 0) following")
                }
                .onTapGesture {
                    navigationManager.navigate(to: ProfileNavigationValues.following(userLogin: vm.user?.login))
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
    
    private var itemsSection: some View {
        Section {
            ForEach(vm.gitHubItems){ item in
                NavigationLink(value: item.navigationItem) {
                    ListRowItem(
                        iconBackground: item.iconBackgroundColor,
                        iconName: item.systemImage,
                        title: item.title
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
    ProfileView(userLogin: "CLEMENTMOLEKO")
}

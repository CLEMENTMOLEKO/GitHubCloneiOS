//
//  ProfileView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct ProfileView: View {
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
                case .failed:
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
                AsyncImage(url: URL(string: vm.user?.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .fill(.gray)
                        .overlay(
                            ProgressView()
                        )
                }
                .frame(width: 80)
                Text(vm.user?.login.uppercased() ?? "")
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30){
                Text(vm.user?.bio ?? "")
                HStack{
                    Image(systemName: "person")
                    Text("\(vm.user?.following ?? 0) following")
                }
                .font(.headline)
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var itemsSection: some View {
        Section {
            ForEach(vm.gitHubItems){ item in
                //TODO: this should be a component it's used everywhere (profile view, explore view)
                NavigationLink(value: item) {
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
    
    private var popularSection: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    AsyncImage(url: URL(string: vm.user?.avatarUrl ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .fill(.gray)
                            .overlay(
                                ProgressView()
                            )
                    }
                    .frame(width: 30)
                    
                    Text(vm.user?.login.uppercased() ?? "")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("repository name placeholder") //TODO: we need to get popular repos for the logged in user.
                    .font(.headline)
                Text("This is the placeholder for the popular repository shown on the profile")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 5))
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
}

#Preview {
    ProfileView()
}

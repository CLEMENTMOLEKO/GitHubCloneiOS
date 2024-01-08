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
                detailSection
                itemsSection
                popularSection
            }
            .listStyle(.grouped)
            .toolbar{
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button{
                        
                    } label: {
                        Image(systemName: "gearshape")
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
        }
    }
}

private extension ProfileView {
    
    private var detailSection: some View {
        Section {
            HStack {
                AsyncImage(url: URL(string: "https://picsum.photos/200")) { image in
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
                Text("Username Placeholder".uppercased())
                Spacer()
            }
            
            VStack(alignment: .leading, spacing: 30){
                Text("This is the bio placeholder and we are typing a long message so we see how it displays")
                HStack{
                    Image(systemName: "person")
                    Text("1 following")
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
                    AsyncImage(url: URL(string: "https://picsum.photos/200")) { image in
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
                    
                    Text("Username Placeholder".uppercased())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("repository name placeholder")
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

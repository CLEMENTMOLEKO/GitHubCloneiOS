//
//  NotificationsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/04.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var vm: HomeViewModel = .init()

    var body: some View {
        NavigationStack {
            HStack{
                Button{
                    
                } label: {
                    HStack{
                        Text("Inbox")
                        Image(systemName: "chevron.down")
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
                
                Button{
                    
                } label: {
                    HStack{
                        Text("Inbox")
                        Image(systemName: "chevron.down")
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: .infinity)
            List {
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
                } header: {
                    HStack {
                        Text("My Work")
                        Spacer()
                        Button {
                            //currentHomeSheet = .myWork
                        } label: {
                            Image(systemName: "ellipsis")
                        }

                    }
                }
                .headerProminence(.increased)
            }
            .frame(maxWidth: .infinity)
            .background(.blue)
            .navigationTitle("Inbox")
            .toolbar{
                
            }
        }
    }
}

#Preview {
    NotificationsView()
}

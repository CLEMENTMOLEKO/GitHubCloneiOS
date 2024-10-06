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
                        NavigationLink(value: item) {
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

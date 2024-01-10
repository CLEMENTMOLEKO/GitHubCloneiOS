//
//  MyWorksViewSort.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/09.
//

import SwiftUI

struct MyWorksViewSort: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var vm: HomeViewModel
    
    var body: some View {
        NavigationStack {
            List(selection: $vm.selectedGitHubItems) {
                //Used id: \.self even though it confirms to identifiable because of selection, unless I make selection a set of type UUID
                ForEach(vm.gitHubItems, id: \.self){ item in
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
                    .frame(height: 37)
                }
                .onMove(perform: vm.move)
            }
            .navigationTitle("Edit My Works")
            .toolbarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done"){
                        dismiss()
                    }
                }
            }
        }
        .environment(\.editMode, .constant(EditMode.active))
    }
    
}

#Preview {
    MyWorksViewSort(vm: HomeViewModel())
}

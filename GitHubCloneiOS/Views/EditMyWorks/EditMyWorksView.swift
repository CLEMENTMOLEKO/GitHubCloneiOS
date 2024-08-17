//
//  EditMyWorksView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/17.
//

import SwiftUI

struct EditMyWorksView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditMyWorksViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List(selection: $viewModel.selectedGitHubItems) {
                //Used id: \.self even though it confirms to identifiable because of selection, unless I make selection a set of type UUID
                ForEach(viewModel.gitHubItems){ item in
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
                .onMove(perform: viewModel.move)
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
    EditMyWorksView()
}

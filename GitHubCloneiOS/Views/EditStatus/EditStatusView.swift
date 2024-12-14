//
//  EditStatusView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/14.
//

import SwiftUI

struct EditStatusView: View {
    @Environment(\.dismiss) private var dismiss
    @State var viewModel: EditStatusViewModel = .init()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack(alignment: .center) {
                        Image(systemName: "smiley.fill")
                            .padding(4)
                            .background(Color.secondary.opacity(0.5))
                            .border(Color.secondary, width: 1)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                        TextEditor(text: $viewModel.statusMessage)
                    }
                } footer: {
                    //TODO: calucate chars left from editor.
                    Text("80 characters remaining")
                }
                
                Section {
                    Toggle("Busy", isOn: $viewModel.isBusy)
                } footer: {
                    Text("When others mention you, assign you, or request your review, GitHub will let them know that you have limited availability.")
                }
                
                Section {
                    Picker("Clear after...", selection: $viewModel.clearAfter) {
                        ForEach(ClearAfter.allCases, id: \.self) { clearAfter in
                            Text(clearAfter.text)
                                .tag(clearAfter)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Visibility", selection: .constant("Everyone")) {
                        Text("Everyone").tag("Everyone")
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("Edit your current status")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel ) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                    }
                    .disabled(viewModel.statusMessage.isEmpty)
                }
            }
        }
        
    }
}

#Preview {
    EditStatusView()
}

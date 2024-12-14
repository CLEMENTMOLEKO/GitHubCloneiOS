//
//  EditStatusView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/14.
//

import SwiftUI

struct EditStatusView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "smiley.fill")
                            .padding(2)
                            .background(Color.green)
                            .clipShape(RoundedRectangle(cornerRadius: 2))
                        TextEditor(text: .constant("Hello World!"))
                    }
                } footer: {
                    //TODO: calucate chars left from editor.
                    Text("80 characters remaining")
                }
                
                Section {
                    Toggle("Busy", isOn: .constant(false))
                } footer: {
                    Text("When others mention you, assign you, or request your review, GitHub will let them know that you have limited availability.")
                }
                
                Section {
                    Picker("Clear after...", selection: .constant("Open")) {
                        Text("Open").tag("Open")
                        Text("Closed").tag("Closed")
                    }
                    .pickerStyle(.menu)
                    
                    Picker("Visibility", selection: .constant("Open")) {
                        Text("Open").tag("Open")
                        Text("Closed").tag("Closed")
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
                    .disabled(true) //TODO: add disabled logic.
                }
            }
        }
        
    }
}

#Preview {
    EditStatusView()
}

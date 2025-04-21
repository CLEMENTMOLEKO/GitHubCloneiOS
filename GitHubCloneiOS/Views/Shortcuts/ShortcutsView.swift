//
//  ShortcutsView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/12.
//

import SwiftUI

struct ShortcutsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var viewModel: ShortcutsViewModel = .init()
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.selectedShortcuts) { shortcut in
                    HStack(spacing: 12) {
                        Button {
                            withAnimation {
                                viewModel.deleteShortcut(shortcut)
                            }
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .font(.title2)
                                .symbolRenderingMode(.multicolor)
                        }

                        ListRowItem(
                            iconBackground: shortcut.iconBackgroundColor.opacity(0.4),
                            iconName: shortcut.systemImage,
                            title: shortcut.title,
                            subtitle: shortcut.myWorkCategory,
                            iconColor: shortcut.iconBackgroundColor
                        )
                    }
                }
            }
            Section {
                Button("Create New Shortcut", systemImage: "plus") {
                    viewModel.showCreateShortCutView.toggle()
                }
            }
            
            Section {
                ForEach(viewModel.suggestedShortcutsList) { shortcut in
                    HStack(spacing: 12) {
                        Button {
                            withAnimation {
                                viewModel.selectShortcut(shortcut)
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .symbolRenderingMode(.multicolor)
                        }

                        ListRowItem(
                            iconBackground: shortcut.iconBackgroundColor.opacity(0.4),
                            iconName: shortcut.systemImage,
                            title: shortcut.title,
                            subtitle: shortcut.myWorkCategory,
                            iconColor: shortcut.iconBackgroundColor
                        )
                    }
                    
                }
                
            } header: {
                Text("Suggested Shortcuts")
            }
        }
        .navigationTitle("Shortcuts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                   dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                   dismiss()
                }
            }
        }
        .sheet(isPresented: $viewModel.showCreateShortCutView) {
            NavigationStack {
                CreateShortCutView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ShortcutsView()
    }
}

//
//  MenuFilter.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/05/24.
//

import SwiftUI

struct MenuFilter<Value: Option>: View {
    let options: [Value]
    @Binding var selection: Value
    
    var body: some View {
        Menu {
            ForEach(options) { opt in
                Button(opt.text) {
                    selection = opt
                }
            }
        } label: {
            MenuFilterLabel(text: selection.text)
        }
    }
}

struct MenuFilterLabel: View {
    let text: String
    
    var body: some View {
        HStack(spacing: 4) {
            Text(text)
                .font(.caption)
            Image(systemName: "chevron.down")
                .font(.caption)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            Capsule()
                .stroke(lineWidth: 0.5)
        )
        .cornerRadius(16)
        .foregroundStyle(Color.secondary)
    }
}

#Preview {
//    MenuFilter()
}

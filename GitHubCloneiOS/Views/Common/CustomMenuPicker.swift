//
//  CustomMenuPicker.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/02/23.
//

import SwiftUI

struct CustomMenuPicker<T: Hashable & RawRepresentable & CaseIterable>: View
where T.RawValue == String, T.AllCases : RandomAccessCollection {
    let label: String
    @Binding var selection: T
    let allCases: T.AllCases
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(allCases, id: \.self) { value in
                Text(value.rawValue).tag(value)
            }
        } label: {
            HStack(spacing: 4) {
                Text(selection.rawValue)
                    .font(.caption)
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .semibold))
            }
            .font(.callout)
        }
        .pickerStyle(.menu)
        .background(Capsule().fill(Color(uiColor: .secondarySystemFill)))
    }
}

#Preview {
//    CustomMenuPicker()
}

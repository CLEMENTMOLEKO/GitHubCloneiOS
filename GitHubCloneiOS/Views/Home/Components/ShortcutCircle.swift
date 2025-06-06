//
//  ShortcutCircle.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/04/12.
//

import SwiftUI

struct ShortcutCircle: View {
    let shortcut: ShortCut
    
    var body: some View {
        Circle()
            .fill(shortcut.color.opacity(0.3))
            .strokeBorder(style: StrokeStyle(lineWidth: 2))
            .foregroundStyle(Color(uiColor: .secondarySystemFill))
            .frame(width: 30, height: 30)
            .overlay{
                Image(systemName: shortcut.icon)
                    .foregroundStyle(shortcut.color.opacity(0.8))
                    .font(.system(size: 14, weight: .bold))
            }
            .background(Color(uiColor: .systemGroupedBackground), in: .circle)
    }
}

#Preview {
    ShortcutCircle(shortcut: ShortCut(icon: "plus", color: .blue))
}

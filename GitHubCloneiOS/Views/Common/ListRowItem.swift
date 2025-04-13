//
//  ListRowItem.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/10/05.
//

import SwiftUI

struct ListRowItem: View {
    let iconBackground: Color
    let iconName: String
    let title: String
    let subtitle: String?
    let iconColor: Color?
    
    init(iconBackground: Color, iconName: String, title: String,subtitle: String? = nil ,iconColor: Color? = nil) {
        self.iconBackground = iconBackground
        self.iconName = iconName
        self.title = title
        self.subtitle = subtitle
        self.iconColor = iconColor
    }
    
    var body: some View {
        HStack(spacing: 10) {
            RoundedRectangle(cornerRadius: 5)
                .fill(iconBackground)
                .frame(width: 35, height: 35)
                .overlay{
                    Image(systemName: iconName)
                        .font(.system(size: CGFloat(15)))
                        .fontWeight(.bold)
                        .foregroundColor(iconColor ?? .white)
                }
            
            VStack(alignment: .leading) {
                if let subtitle {
                    Text(subtitle)
                        .font(.callout)
                }
                Text(title)
            }
        }
        .frame(height: 37) //Hot fix.
    }
}

#Preview {
    ListRowItem(
        iconBackground: .red,
        iconName: "person.crop.circle.fill",
        title: "Clement Skosana"
    )
}

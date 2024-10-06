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
    let name: String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(iconBackground)
                .frame(width: 35, height: 35)
                .overlay{
                    Image(systemName: iconName)
                        .font(.system(size: CGFloat(15)))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
            Text(name)
        }
        .frame(height: 37) //Hot fix.
    }
}

#Preview {
    ListRowItem(
        iconBackground: .red,
        iconName: "person.crop.circle.fill",
        name: "Clement Skosana"
    )
}

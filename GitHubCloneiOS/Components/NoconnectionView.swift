//
//  NoconnectionView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/01/20.
//

import SwiftUI

struct NoconnectionView: View {
    var body: some View {
        VStack {
            Image(systemName: "network.slash")
                .font(.system(size: 40))
                .symbolRenderingMode(.multicolor)
                .frame(maxWidth: .infinity)
            Text("Error Connecting")
        }
    }
}

#Preview {
    NoconnectionView()
}

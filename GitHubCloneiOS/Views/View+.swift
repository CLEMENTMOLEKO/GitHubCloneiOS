//
//  View+.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/07/13.
//

import SwiftUI

extension View {
    func navigationStackWithDestination<T>(for value: T.Type) -> some View where T: Hashable & View {
        NavigationStack {
            self
                .navigationDestination(for: value) { $0 }
        }
    }
}

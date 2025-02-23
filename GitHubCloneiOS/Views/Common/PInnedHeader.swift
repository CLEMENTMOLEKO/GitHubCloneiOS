//
//  PInnedHeader.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2025/02/23.
//

import SwiftUI

struct PinnedHeader: View {
    @State private var yOffset: CGFloat = 8
    @Environment(IssuesViewModel.self) var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        
        FilterRow(
        )
        .background(
            yOffset < 153 ? Rectangle().fill(.bar).opacity(1) : Rectangle().fill(.bar).opacity(0)
        )
        .background(
            //Empty geometry reader used to find out filter row position.
            GeometryReader { proxy in
                //TODO: why is preference change firing once even when we scroll? geometry reader is not updating. always zero.
                Rectangle()
                    .fill(.clear)
                    .preference(
                        key: HeaderOffsetPreferenceKey.self,
                        value: proxy.frame(in: .global).minY
                    )
            }
        )
        .onPreferenceChange(HeaderOffsetPreferenceKey.self, perform: { value in
            yOffset = value
        })
    }
}

struct HeaderOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

#Preview {
    PinnedHeader()
        .environment(IssuesViewModel())
}

//
//  MarkDownView.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/10/06.
//

import SwiftUI
import MarkdownUI

struct MarkDownView: View {
    let markDownUrl: String
    
    @StateObject var markDownViewModel: MarkDownViewModel
    
    init (markDownUrl: String) {
        self.markDownUrl = markDownUrl
        _markDownViewModel = StateObject(
            wrappedValue: MarkDownViewModel(
                url: markDownUrl
            )
        )
    }
    
    var body: some View {
        Group {
            switch markDownViewModel.markDownLoading{
            case .loading: ProgressView()
            case .success: markDownView
                // TODO: use alert or system image for error, this is only for debugging.
            case .failure: Text("Error occured")
            }
            
        }
        .task {
            await markDownViewModel.getMarkDownContent()
        }
    }
    
    @ViewBuilder
    private var markDownView: some View {
        if let markDownContent = markDownViewModel.markDownContent {
            Markdown(markDownContent)
        }
    }
}

#Preview {
    MarkDownView(markDownUrl: "# Hello World")
}

//
//  PressableModifier.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/12/14.
//

import SwiftUI

struct PressableButtonStyle: ViewModifier {
    @State private var isPressed = false
    let scaleFactor: CGFloat
    let action: () -> Void
    
    init(scaleFactor: CGFloat = 0.95, action: @escaping () -> Void) {
        self.scaleFactor = scaleFactor
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? scaleFactor : 1.0)
            .gesture(
                LongPressGesture(minimumDuration: 0)
                    .onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.25)) {
                            isPressed = true
                        } completion: {
                            isPressed = false
                            action()
                        }
                    }
            )
    }
}

// Extension to make it easier to use
extension View {
    func pressable(scaleFactor: CGFloat = 0.95, action: @escaping () -> Void) -> some View {
        modifier(PressableButtonStyle(scaleFactor: scaleFactor, action: action))
    }
}


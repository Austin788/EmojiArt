//
//  Spanning.swift
//  EmojiArt
//
//  Created by Austin Zheng on 2020/12/28.
//

import SwiftUI

struct Spanning: ViewModifier {
    @State var isVisible = false
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: isVisible ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear { self.isVisible = true }
    }
}

extension View {
    func spanning() -> some View {
        self.modifier(Spanning())
    }
}

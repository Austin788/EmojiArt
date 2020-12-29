//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Austin Zheng on 2020/12/24.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}

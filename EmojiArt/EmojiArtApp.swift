//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Austin Zheng on 2020/12/23.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
//            EmojiArtDocumentView(document: EmojiArtDocument())
            EmojiArtDocumentChooser().environmentObject(EmojiArtDocumentStore(named: "Emoji Art"))
        }
    }
}

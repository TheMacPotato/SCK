//
//  KeyboardInputController.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/06.
//

import SwiftUI

struct KeyboardInputController {
    @MainActor static func insertText(_ text: String, proxy: UITextDocumentProxy) {
        proxy.insertText(text)
    }

    @MainActor static func deleteText(proxy: UITextDocumentProxy) {
        guard proxy.hasText else { return }
        proxy.deleteBackward()
    }

    @MainActor static func moveCursorLeft(proxy: UITextDocumentProxy) {
        if let before = proxy.documentContextBeforeInput {
            let offset = before.prefix(1).utf16.count * -1
            proxy.adjustTextPosition(byCharacterOffset: offset)
        } else {
            proxy.adjustTextPosition(byCharacterOffset: -1)
        }
    }

    @MainActor static func moveCursorRight(proxy: UITextDocumentProxy) {
        if let after = proxy.documentContextAfterInput {
            if after.isEmpty {
                proxy.adjustTextPosition(byCharacterOffset: 1)
            } else {
                let offset = after.prefix(1).utf16.count
                proxy.adjustTextPosition(byCharacterOffset: offset)
            }
        } else {
            proxy.adjustTextPosition(byCharacterOffset: 1)
        }
    }
}

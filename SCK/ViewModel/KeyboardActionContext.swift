//
//  KeyboardActionContext.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/10.
//

import Foundation
import UIKit
import SwiftUICore

final class KeyboardActionContext: ObservableObject {
    var shift = ShiftState()              // Shift状態の保持（大文字小文字
    @Published var keyboardMode = KeyboardMode()  // キーボードモードの監視
    
    
    var inputProxy: UITextDocumentProxy?

    func insert(_ text: String) {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.insertText(text, proxy: proxy)
    }

    func delete() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.deleteText(proxy: proxy)
    }

    func moveCursorLeft() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.moveCursorLeft(proxy: proxy)
    }
    
    func moveCursorRight() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.moveCursorRight(proxy: proxy)
    }
    func bracket(_ key: String) {
        let char: String? = {
            switch keyboardMode.current {
            case .default:
                return shift.isOn() ? defaultKeys[key] : defaultShiftKeys[key]
            case .subscriptMode:
                return shift.isOn() ? subScriptKeys[key] : subScriptShiftKeys[key]
            case .superscript:
                return shift.isOn() ? superScriptKeys[key] : superScriptShiftKeys[key]
            case .greek:
                return shift.isOn() ? greekKeys[key] : greekShiftKeys[key]
            case .math:
                return shift.isOn() ? defaultKeys[key] : defaultShiftKeys[key]
            }
        }()

        if let char = char {
            insert(char)
            moveCursorLeft()
        }
    }
}

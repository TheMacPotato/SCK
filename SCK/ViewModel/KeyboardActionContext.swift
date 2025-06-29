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
    @Published var shift: ShiftState              // Shift状態の保持（大文字小文字
    @Published var keyboardMode: KeyboardMode  // キーボードモードの監視
    var inputProxy: UITextDocumentProxy?
    
    init(shift: ShiftState, keyboardMode: KeyboardMode) {
        self.shift = shift
        self.keyboardMode = keyboardMode
    }
    
    @MainActor func insert(_ text: String) {
        guard let proxy = inputProxy else { return }
        print("[INSERT] text: \(text), mode: \(keyboardMode.current), shift: \(shift.state)")
        KeyboardInputController.insertText(KeyboardActions(mode: keyboardMode.current, isShiftOn: shift.isOn()).keyDictionary[text] ?? "nope", proxy: proxy)
    }
    
    @MainActor func enter() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.insertText("\n", proxy: proxy)
    }
    
    @MainActor func space() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.insertText(" ", proxy: proxy)
    }

    @MainActor func delete() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.deleteText(proxy: proxy)
    }

    @MainActor func moveCursorLeft() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.moveCursorLeft(proxy: proxy)
    }
    
    @MainActor func moveCursorRight() {
        guard let proxy = inputProxy else { return }
        KeyboardInputController.moveCursorRight(proxy: proxy)
    }
    @MainActor func bracket(_ key: String) {
        guard let proxy = inputProxy else { return }
        
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
                return mathKeys[key]
            }
        }()

        print("[BRACKET] key: \(key), resolved char: \(String(describing: char)), mode: \(keyboardMode.current), shift: \(shift.state)")
        if let char = char {
            KeyboardInputController.insertText(char, proxy: proxy)
            moveCursorLeft()
        }
    }
}

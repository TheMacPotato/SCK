//
//  KeyboardActions.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/10.
//

import Foundation

struct KeyboardActions {
    let mode: KeyboardMode.Mode
    let isShiftOn: Bool

    var keyDictionary: [String: String] {
        switch mode {
        case .default:
            return isShiftOn ? defaultShiftKeys : defaultKeys
        case .subscriptMode:
            return isShiftOn ? subScriptShiftKeys : subScriptKeys
        case .superscript:
            return isShiftOn ? superScriptShiftKeys : superScriptKeys
        case .greek:
            return isShiftOn ? greekShiftKeys : greekKeys
        case .math:
            return mathKeys
        }
    }

    func isValidKey(_ key: String) -> Bool {
        let exists = keyDictionary[key] != nil
        print("[VALIDATE] key: \(key), mode: \(mode), shift: \(isShiftOn), exists: \(exists)")
        return exists
    }
    
    func key(for key: String) -> String? {
        return keyDictionary[key]
    }
}

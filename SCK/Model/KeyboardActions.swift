//
//  KeyboardActions.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/10.
//

import Foundation

struct KeyboardActions {
    let mode: KeyboardMode.Mode
    let shiftState: ShiftState

    var keyDictionary: [String: String] {
        switch mode {
        case .default:
            return shiftState.isOn() ? defaultShiftKeys : defaultKeys
        case .subscriptMode:
            return shiftState.isOn() ? subScriptShiftKeys : subScriptKeys
        case .superscript:
            return shiftState.isOn() ? superScriptShiftKeys : superScriptKeys
        case .greek:
            return shiftState.isOn() ? greekShiftKeys : greekKeys
        case .math:
            return mathKeys
        }
    }

    func key(for key: String) -> String? {
        return keyDictionary[key]
    }
}

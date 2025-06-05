//
//  ShiftState.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//


import SwiftUI

// MARK: - Shiftキーの状態を管理するクラス
// SwiftUIのビューで状態の共有に使用（大文字・小文字の切り替えに対応）
final class ShiftState: ObservableObject {

    // Shiftの状態を表す列挙型
    enum State {
        case off  // Shiftオフ（小文字入力）
        case on   // Shiftオン（大文字入力）
    }

    // 現在のShift状態。変更があるとビューが自動更新される
    @Published var state: State = .off

    // Shift状態をトグル（on ⇄ off）するメソッド
    func toggle() {
        state = (state == .off ? .on : .off)
    }
}

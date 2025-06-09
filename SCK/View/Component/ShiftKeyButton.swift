//
//  ShiftKeyButton.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// MARK: - Shift（大文字/小文字）切り替え用のカスタムボタン
/// `ShiftState` を利用して状態を保持し、押すたびに状態をトグル（on/off）
/// 視覚的にもオンのときは背景色を変えて状態を明示する
struct ShiftKeyButton: View {
    // Shiftキーの状態（on/off）を共有するオブジェクト
    @EnvironmentObject var shift: ShiftState
    
    var body: some View {
        Button {
            // Shiftの状態をトグル（on → off / off → on）
            shift.toggle()
        } label: {
            Image(systemName: "shift")  // SF Symbols の Shiftアイコン
                .frame(width: 44, height: 40)                           // キーサイズ
                .foregroundColor(shift.isOn() ? .black : .white)          // 文字色
                .background(shift.isOn() ? Color.white : Color(uiColor: .darkGray)) // 背景
                .clipShape(RoundedRectangle(cornerRadius: 8))           // 角丸ボタン
        }
    }
}

// MARK: - プレビュー（Xcode Canvas）
#Preview {
    ShiftKeyButton()
        .environmentObject(ShiftState())    // プレビュー用に ShiftState を注入
}

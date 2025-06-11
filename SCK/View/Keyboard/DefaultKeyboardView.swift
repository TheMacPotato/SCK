//
//  DefaultKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//


import SwiftUI

// MARK: - デフォルトキーボードレイアウトのビュー
/// 数字・演算子・アルファベットを含む一般的な入力行を構成する

struct DefaultKeyboardView: View {
    @EnvironmentObject var shift: ShiftState    // Shiftキーの状態（大文字/小文字）を管理
    @EnvironmentObject var actionContext: KeyboardActionContext
    let thisMode: KeyboardMode.Mode = .default
    var body: some View {
        return VStack {
            // 数字行（1〜0）
            NumRow()

            // 演算子＋括弧行（変更なし）
            OperatorRow(
                opKeys: ["+","-","×","÷","=","/"],             // 演算子キー
                bracketKeys: ["( )","{ }","[ ]"],               // 括弧キー（括弧ペアで処理される想定）
                mode: thisMode
            )

            // アルファベット行（Shift が ON の場合は大文字）
            KeyRow(keys: shift.state == .on
                         ? ["Q","W","E","R","T","Y","U","I","O","P"]
                         : ["q","w","e","r","t","y","u","i","o","p"],
                   mode: thisMode,
                   isShift: shift.isOn()
            )

            KeyRow(keys: shift.state == .on
                         ? ["A","S","D","F","G","H","J","K","L"]
                         : ["a","s","d","f","g","h","j","k","l"],
                   mode: thisMode,
                   isShift: shift.isOn()
            )
            
            // 最下段（Shiftキー、Z〜M、Deleteキー）
            HStack {
                ShiftKeyButton()                            // Shiftトグルボタン（状態は環境で共有）
                KeyRow(keys: shift.state == .on
                       ? ["Z","X","C","V","B","N","M"]
                       : ["z","x","c","v","b","n","m"],
                       mode: thisMode,
                       isShift: shift.isOn()
                )
                DeleteButton()    // 1文字削除
            }
        }
        .environmentObject(actionContext)
    }
}

// MARK: - プレビュー（Xcode Canvas用）
/// 各アクションを `print` にして確認できる
#Preview {
    DefaultKeyboardView()
    .environmentObject(ShiftState())
}

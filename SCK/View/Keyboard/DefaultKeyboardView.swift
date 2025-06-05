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
    
    // 各キー種別ごとのアクション（親ビューから渡される）
    let keyAction: (String) -> Void             // 通常キー（アルファベット・記号など）
    let bracketAction: (String) -> Void         // 括弧キー（( ), { }, [ ] など）
    let inputTextAction: (String) -> Void       // 任意の文字列挿入用（ここでは "/" に使用）
    let deleteAction: () -> Void                // バックスペース（1文字削除）
    
    var body: some View {
        return VStack {
            // 数字行（1〜0）
            NumRow(keyAction: keyAction)

            // 演算子＋括弧行（変更なし）
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],             // 演算子キー
                bracketKeys: ["( )","{ }","[ ]"],              // 括弧キー（括弧ペアで処理される想定）
                opAction: keyAction,                           // 演算子は通常の keyAction で処理
                bracketAction: bracketAction,                 // 括弧は専用アクションでカーソル移動など対応
                slashAction: { inputTextAction("/") }         // スラッシュのみ特別に処理
            )

            // アルファベット行（Shift が ON の場合は大文字）
            KeyRow(keys: shift.state == .on
                         ? ["Q","W","E","R","T","Y","U","I","O","P"]
                         : ["q","w","e","r","t","y","u","i","o","p"],
                   action: keyAction)

            KeyRow(keys: shift.state == .on
                         ? ["A","S","D","F","G","H","J","K","L"]
                         : ["a","s","d","f","g","h","j","k","l"],
                   action: keyAction)
            
            // 最下段（Shiftキー、Z〜M、Deleteキー）
            HStack {
                ShiftKeyButton()                            // Shiftトグルボタン（状態は環境で共有）
                KeyRow(keys: shift.state == .on
                       ? ["Z","X","C","V","B","N","M"]
                       : ["z","x","c","v","b","n","m"],
                       action: keyAction)
                DeleteButton(deleteAction: deleteAction)    // 1文字削除
            }
        }
    }
}

// MARK: - プレビュー（Xcode Canvas用）
/// 各アクションを `print` にして確認できる
#Preview {
    DefaultKeyboardView(
        keyAction: { print("Key action: \($0)") },
        bracketAction: { print("Bracket action: \($0)") },
        inputTextAction: { print("Input text action: \($0)") },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

//
//  SubscriptKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

// MARK: - 下付き文字キーボードビュー
/// 数式や化学式で使われる下付き数字や文字を入力する専用レイアウト
struct SubscriptKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    
    // 各アクションは外部から注入される
    let keyAction: (String) -> Void                        // 通常キー入力処理
    let bracketAction: (String) -> Void                    // 括弧キー入力処理（括弧後カーソル戻しなど）
    let inputTextAction: (String) -> Void                  // 任意の文字入力（ここでは "/" など）
    let deleteAction: () -> Void                           // バックスペース処理
    
    var body: some View {
        let isUpper = shift.state == .on   // Shift で大文字／小文字切替（下付き文字は数字のみなので行 1 へ影響なし）
        
        VStack {
            // 下付き数字行
            NumRow(keyAction: keyAction)
            
            // 演算子＋括弧行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )
            
            // アルファベット行（Shift で大文字表示）
            KeyRow(
                keys: isUpper ? ["Q","W","E","R","T","Y","U","I","O","P"]
                : ["q","w","e","r","t","y","u","i","o","p"],
                action: keyAction
            )
            KeyRow(
                keys: isUpper ? ["A","S","D","F","G","H","J","K","L"]
                : ["a","s","d","f","g","h","j","k","l"],
                action: keyAction
            )
            HStack {
                ShiftKeyButton()
                KeyRow(
                    keys: isUpper ? ["Z","X","C","V","B","N","M"]
                    : ["z","x","c","v","b","n","m"],
                    action: keyAction
                )
                DeleteButton(deleteAction: deleteAction)
            }
        }
    }
}


// MARK: - プレビュー（Xcode Canvas用）
/// 入力アクションの挙動を print で確認可能
#Preview {
    SubscriptKeyboardView(
        keyAction: { print("Key action:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

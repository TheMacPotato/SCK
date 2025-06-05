//
//  SubscriptKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// 下付き文字キーボード
struct SubscriptKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    let keyAction: (String) -> Void
    let bracketAction: (String) -> Void
    let inputTextAction: (String) -> Void
    let deleteAction: () -> Void
    
    var body: some View {
        let isUpper = shift.state == .on   // Shift で大文字／小文字切替（下付き文字は数字のみなので行 1 へ影響なし）
        
        VStack {
            // ① 下付き数字行
            NumRow(keyAction: keyAction)
            
            // ② 演算子＋括弧行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )
            
            // ③ アルファベット行（Shift で大文字表示）
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

#Preview {
    SubscriptKeyboardView(
        keyAction: { print("Key action:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

//
//  DefaultKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//


import SwiftUI

struct DefaultKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    let keyAction: (String) -> Void
    let bracketAction: (String) -> Void
    let inputTextAction: (String) -> Void
    let deleteAction: () -> Void
    
    var body: some View {
        return VStack {
            NumRow(keyAction: keyAction)

            // ② 演算子＋括弧行（変更なし）
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )

            // ③ アルファベット行（Shift が ON の場合は大文字）
            KeyRow(keys: shift.state == .on
                         ? ["Q","W","E","R","T","Y","U","I","O","P"]
                         : ["q","w","e","r","t","y","u","i","o","p"],
                   action: keyAction)

            KeyRow(keys: shift.state == .on
                         ? ["A","S","D","F","G","H","J","K","L"]
                         : ["a","s","d","f","g","h","j","k","l"],
                   action: keyAction)
            HStack {
                ShiftKeyButton()
                KeyRow(keys: shift.state == .on
                       ? ["Z","X","C","V","B","N","M"]
                       : ["z","x","c","v","b","n","m"],
                       action: keyAction)
                DeleteButton(deleteAction: deleteAction)
            }
        }
    }
}

#Preview {
    DefaultKeyboardView(
        keyAction: { print("Key action: \($0)") },
        bracketAction: { print("Bracket action: \($0)") },
        inputTextAction: { print("Input text action: \($0)") },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

//
//  GreekKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// ギリシャ文字キーボード
struct GreekKeyboardView: View {
    @EnvironmentObject var shift: ShiftState               // Shift 状態（大文字切替）
    let keyAction: (String) -> Void
    let bracketAction: (String) -> Void
    let inputTextAction: (String) -> Void
    let deleteAction: () -> Void
    
    // ギリシャ文字配列（小文字）
    private let row1Lower = ["α","β","γ","δ","ε","ζ","η","θ","ι","κ"]
    private let row2Lower = ["λ","μ","ν","ξ","ο","π","ρ","σ","τ"]
    private let row3Lower = ["υ","φ","χ","ψ","ω"]
    
    // 大文字は lower.map { $0.uppercased() }
    private var row1Upper: [String] { row1Lower.map { $0.uppercased() } }
    private var row2Upper: [String] { row2Lower.map { $0.uppercased() } }
    private var row3Upper: [String] { row3Lower.map { $0.uppercased() } }
    
    var body: some View {
        let isUpper = shift.state == .on
        
        VStack {
            // ① ローマ数字行
            KeyRow(
                keys: ["I","II","III","IV","V","VI","VII","VIII","IX","X"],
                action: keyAction
            )
            
            // ② 演算子＋括弧行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )
            
            // ③ ギリシャ文字行
            KeyRow(keys: isUpper ? row1Upper : row1Lower, action: keyAction)
            KeyRow(keys: isUpper ? row2Upper : row2Lower, action: keyAction)
            HStack {
                ShiftKeyButton()
                KeyRow(keys: isUpper ? row3Upper : row3Lower, action: keyAction)
                DeleteButton(deleteAction: deleteAction)
            }
        }
    }
}

#Preview {
    GreekKeyboardView(
        keyAction: { print("Key:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

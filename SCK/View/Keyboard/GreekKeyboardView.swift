//
//  GreekKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

// MARK: - ギリシャ文字キーボードのレイアウトビュー
/// ローマ数字・演算子・ギリシャ文字を含む構成で、Shift 状態に応じて大文字・小文字を切り替える
struct GreekKeyboardView: View {
    @EnvironmentObject var shift: ShiftState               // Shiftキーの状態（on/off）を共有
    
    // 外部から渡されるアクション定義
    let keyAction: (String) -> Void                        // 通常キー入力
    let bracketAction: (String) -> Void                    // 括弧入力（( ) など）
    let inputTextAction: (String) -> Void                  // 任意文字入力（ここでは "/"）
    let deleteAction: () -> Void                           // 削除処理
    
    // ギリシャ文字の各行（小文字）
    private let row1Lower = ["α","β","γ","δ","ε","ζ","η","θ","ι","κ"]
    private let row2Lower = ["λ","μ","ν","ξ","ο","π","ρ","σ","τ"]
    private let row3Lower = ["υ","φ","χ","ψ","ω"]
    
    // Shift がオンのときは大文字を表示
    private var row1Upper: [String] { row1Lower.map { $0.uppercased() } }
    private var row2Upper: [String] { row2Lower.map { $0.uppercased() } }
    private var row3Upper: [String] { row3Lower.map { $0.uppercased() } }
    
    var body: some View {
        let isUpper = shift.state == .on   // Shift 状態に応じて大文字・小文字を切り替え
        
        VStack {
            // ローマ数字の行（I〜X）— 数式や表記用
            KeyRow(
                keys: ["I","II","III","IV","V","VI","VII","VIII","IX","X"],
                action: keyAction
            )
            
            // 演算子と括弧の行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","⇔"],               // 演算子
                bracketKeys: ["( )","{ }","[ ]"],                // 括弧
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }           // スラッシュだけ専用処理
            )
            
            // ギリシャ文字行
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

// MARK: - プレビュー（Xcode Canvas用）
/// アクションを print で可視化して確認できる
#Preview {
    GreekKeyboardView(
        keyAction: { print("Key:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: { print("Delete") }
    )
    .environmentObject(ShiftState())
}

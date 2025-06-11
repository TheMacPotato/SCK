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
    @EnvironmentObject var actionContext: KeyboardActionContext
    
    let thisMode: KeyboardMode.Mode = .greek
    
    // 数式でよく使う順（α, β, γ, π, θ などを上段に優先配置）
    private let row1Lower = ["α", "β", "γ", "δ", "ε", "ζ", "η", "θ", "ι", "κ"]
    private let row2Lower = ["λ", "μ", "ν", "ξ", "ο", "π", "ρ", "σ", "τ"]
    private let row3Lower = ["υ", "φ", "χ", "ψ", "ω"]
    
    // Shift がオンのときは大文字を表示
    private var row1Upper: [String] { row1Lower.map { $0.uppercased() } }
    private var row2Upper: [String] { row2Lower.map { $0.uppercased() } }
    private var row3Upper: [String] { row3Lower.map { $0.uppercased() } }
    
    var body: some View {
        let isUpper = shift.state == .on   // Shift 状態に応じて大文字・小文字を切り替え
        
        VStack {
            // ローマ数字の行（Ⅰ〜Ⅹ）— 数式や表記用
            KeyRow(
                keys: ["Ⅰ","Ⅱ","Ⅲ","Ⅳ","Ⅴ","Ⅵ","Ⅶ","Ⅷ","Ⅸ","Ⅹ"],
                mode: thisMode,
                isShift: false
            )
            
            // 演算子と括弧の行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","/"],               // 演算子
                bracketKeys: ["( )","{ }","[ ]"],                // 括弧
                mode: thisMode
            )
            
            // ギリシャ文字行
            KeyRow(keys: isUpper ? row1Upper : row1Lower, mode: thisMode,
                   isShift: shift.isOn())
            KeyRow(keys: isUpper ? row2Upper : row2Lower, mode: thisMode,
                   isShift: shift.isOn())
            HStack {
                ShiftKeyButton()
                KeyRow(keys: isUpper ? row3Upper : row3Lower, mode: thisMode,
                       isShift: shift.isOn())
                DeleteButton()
            }
        }
        .environmentObject(actionContext)
    }
}

// MARK: - プレビュー（Xcode Canvas用）
/// アクションを print で可視化して確認できる
#Preview {
    GreekKeyboardView()
    .environmentObject(ShiftState())
}

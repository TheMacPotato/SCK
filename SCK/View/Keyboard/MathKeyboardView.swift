//
//  MathKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// 数学記号のカテゴリ
private enum MathCategory: String, CaseIterable, Identifiable {
    case basic = "基本"
    case set   = "集合"
    case logic = "論理"
    case arrow = "矢印"
    case calc  = "微積"

    var id: Self { self }
}

/// 数学記号キーボード（下は一例。必要に応じて追加・並び替え可能）
struct MathKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    let keyAction: (String) -> Void
    let bracketAction: (String) -> Void
    let inputTextAction: (String) -> Void
    let deleteAction: () -> Void
    
    // カテゴリ別の行配列
    private let symbols: [MathCategory: [[String]]] = [
        .basic: [
            ["∞","≈","≠","≡","±","∝","√","∛","∜"],
            ["×","÷","∑","∏","∫","∮"]
        ],
        .set: [
            ["∈","∉","∋","∌","∅","⊂","⊃","⊆","⊇"],
            ["∪","∩","∖","⊖","⊄","⊅"]
        ],
        .logic: [
            ["¬","∧","∨","⇒","⇔","⊢","⊨"],
            ["∀","∃","∴","∵"]
        ],
        .arrow: [
            ["←","→","↑","↓","↔︎","↗︎","↘︎"],
            ["⇐","⇒","⇑","⇓","⇔"]
        ],
        .calc: [
            ["∂","∇","∆","∬","∭","∮","∯","∰"]
        ]
    ]
    
    @State private var category: MathCategory = .basic
    
    var body: some View {
        VStack {
            // カテゴリ切替 Picker
            Picker("カテゴリ", selection: $category) {
                ForEach(MathCategory.allCases) { cat in
                    Text(cat.rawValue).tag(cat)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            NumRow(keyAction: keyAction)
            
            // ② 基本演算子＋括弧行（既存 OperatorRow 再利用）
            OperatorRow(
                opKeys: ["+","-","×","÷","=","±"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )
            
            // ① 数学記号行（Picker切替）
            if let rows = symbols[category] {
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    if index == rows.count - 1 {
                        HStack {
                            ShiftKeyButton()
                            KeyRow(keys: row, action: keyAction)
                            DeleteButton(deleteAction: deleteAction)
                        }
                    } else {
                        KeyRow(keys: row, action: keyAction)
                    }
                }
            }
        }
    }
}

#Preview {
    MathKeyboardView(
        keyAction: { print("Key:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: {print("Delete")}
    )
    .environmentObject(ShiftState())
}

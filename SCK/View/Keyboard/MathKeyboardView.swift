//
//  MathKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI


// MARK: - 数学記号カテゴリの定義
/// 各カテゴリはPickerで切り替え可能。セクション名として表示される
private enum MathCategory: String, CaseIterable, Identifiable {
    case basic = "基本"    // 基本記号（±, √, ∑ など）
    case set   = "集合"    // 集合記号（∈, ∅, ∩ など）
    case logic = "論理"    // 論理記号（∧, ∨, ⇒ など）
    case arrow = "矢印"    // 矢印記号（→, ⇒, ⇔ など）
    case calc  = "微積"    // 微積記号（∂, ∇, ∫ など）
    
    var id: Self { self }  // Identifiable 準拠（Picker表示用）
}

// MARK: - 数学記号キーボードのメインビュー
/// 数式に必要な特殊記号や演算子、数字などをカテゴリ別に表示
struct MathKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    
    // アクション定義（外部から注入）
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
    
    @State private var category: MathCategory = .basic  // 現在選択されているカテゴリ（Pickerと連動）
    
    var body: some View {
        VStack {
            // MARK: - カテゴリ切替 Picker
            Picker("カテゴリ", selection: $category) {
                ForEach(MathCategory.allCases) { cat in
                    Text(cat.rawValue).tag(cat)
                }
            }
            .pickerStyle(.segmented)    // セグメントスタイルで横並び切替
            .padding(.horizontal)
            
            // MARK: - 数字キーの行（共通）
            NumRow(keyAction: keyAction)
            
            // MARK: - 基本演算子＋括弧（共通の行）
            OperatorRow(
                opKeys: ["+","-","×","÷","=","±"],
                bracketKeys: ["( )","{ }","[ ]"],
                opAction: keyAction,
                bracketAction: bracketAction,
                slashAction: { inputTextAction("/") }
            )
            
            // MARK: - 選択カテゴリに応じた数学記号行の表示
            if let rows = symbols[category] {
                ForEach(Array(rows.enumerated()), id: \.offset) { index, row in
                    // 最後の行は Shiftキー＋Deleteキーを含むHStack に包む
                    if index == rows.count - 1 {
                        HStack {
                            ShiftKeyButton()
                            KeyRow(keys: row, action: keyAction)
                            DeleteButton(deleteAction: deleteAction)
                        }
                    } else {
                        // 通常行は KeyRow で水平表示
                        KeyRow(keys: row, action: keyAction)
                    }
                }
            }
        }
    }
}

// MARK: - プレビュー（開発用）
#Preview {
    MathKeyboardView(
        keyAction: { print("Key:", $0) },
        bracketAction: { print("Bracket:", $0) },
        inputTextAction: { print("Input:", $0) },
        deleteAction: {print("Delete")}
    )
    .environmentObject(ShiftState())
}

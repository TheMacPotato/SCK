//
//  KeyboardComponents.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

// MARK: - キーの1行分をまとめたカスタムビュー
// 同一の処理（action）を共有する文字キーの並びを表現
struct KeyRow: View {
    let keys: [String]                  // 表示する文字キーの配列（例："a", "b", "c"）
    let action: (String) -> Void        // キー押下時に呼び出す処理（文字を渡す）
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            // 各キーをButtonとして生成
            ForEach(keys, id: \.self) { key in
                Button { action(key) } label: {
                    Text(key)
                        .frame(width: 30, height: 40)   // キーのサイズ
                        .foregroundColor(colorScheme == .dark ? .white : .black)    // 文字色
                        .background(colorScheme == .dark ? .black : .white)         // 背景色
                        .clipShape(RoundedRectangle(cornerRadius: 4))               // 角丸キー
                }
            }
        }
    }
}

// MARK: - 数式用の操作キー（演算子・括弧・スラッシュ）をまとめた1行のビュー
// 複数の種類のキーが異なるアクションで処理される
struct OperatorRow: View {
    let opKeys: [String]                      // 演算子キー（+, −, ×, ÷など）
    let bracketKeys: [String]                 // 括弧キー（(, ) など）
    let opAction: (String) -> Void            // 演算子キー用の処理
    let bracketAction: (String) -> Void       // 括弧キー用の処理
    let slashAction: () -> Void               // スラッシュ専用の処理（特別扱い）
    
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            // 演算子群を表示（opActionで処理）
            KeyRow(keys: opKeys, action: opAction)
            
            // 括弧キーは個別に処理（bracketAction）
            ForEach(bracketKeys, id: \.self) { key in
                Button { bracketAction(key) } label: {
                    Text(key)
                        .frame(width: 30, height: 40)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(colorScheme == .dark ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            // スラッシュキー（/）は専用のアクションを使用
            Button(action: slashAction) {
                Text("/")
                    .frame(width: 30, height: 40)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .background(colorScheme == .dark ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
            }
        }
    }
}

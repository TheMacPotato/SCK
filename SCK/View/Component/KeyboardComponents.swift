//
//  KeyboardComponents.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// 同じアクションで処理される単純キー1行
struct KeyRow: View {
    let keys: [String]
    let action: (String) -> Void
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                Button { action(key) } label: {
                    Text(key)
                        .frame(width: 30, height: 40)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(colorScheme == .dark ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}

/// 演算子＋括弧＋スラッシュの行
struct OperatorRow: View {
    let opKeys: [String]
    let bracketKeys: [String]
    let opAction: (String) -> Void
    let bracketAction: (String) -> Void
    let slashAction: () -> Void
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        HStack {
            // 演算子
            KeyRow(keys: opKeys, action: opAction)
            // 括弧
            ForEach(bracketKeys, id: \.self) { key in
                Button { bracketAction(key) } label: {
                    Text(key)
                        .frame(width: 30, height: 40)
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .background(colorScheme == .dark ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
            // スラッシュ
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

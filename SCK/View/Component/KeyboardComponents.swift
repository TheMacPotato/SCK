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
    let mode: KeyboardMode.Mode
    let isShift: Bool
    @EnvironmentObject var actionContext: KeyboardActionContext // 各種入力アクション（テキスト挿入・削除・カーソル移動など）をまとめた共有オブジェクト
    
    var body: some View {
        HStack {
            // 各キーをButtonとして生成
            ForEach(keys, id: \.self) { key in
                let isKeyEnable = KeyboardActions(mode: mode, isShiftOn: isShift).isValidKey(key)
                Button { actionContext.insert(key) } label: {
                    Text(key)
                        .frame(width: 30, height: 40)   // キーのサイズ
                        .foregroundColor(isKeyEnable ? Color.white : Color.black)    // 文字色
                        .background(isKeyEnable ? Color.gray : Color.black.opacity(0.6))         // 背景色
                        .clipShape(RoundedRectangle(cornerRadius: 4))               // 角丸キー
                }
                .disabled(!isKeyEnable)
            }
        }
    }
}

// MARK: - 数式用の操作キー（演算子・括弧・スラッシュ）をまとめた1行のビュー
// 複数の種類のキーが異なるアクションで処理される
struct OperatorRow: View {
    let opKeys: [String]                        // 演算子キー（+, −, ×, ÷など）
    let bracketKeys: [String]                   // 括弧キー（(, ) など）
    let mode: KeyboardMode.Mode
    
    
    @EnvironmentObject var actionContext: KeyboardActionContext // 各種入力アクション（テキスト挿入・削除・カーソル移動など）をまとめた共有オブジェクト
    
    var body: some View {

        HStack {
            // 演算子群を表示（opActionで処理）
            KeyRow(keys: opKeys,
            mode: mode,
            isShift: false)
            
            // 括弧キーは個別に処理（bracketAction）
            ForEach(bracketKeys, id: \.self) { key in
                let isKeyEnable = KeyboardActions(mode: mode, isShiftOn: false).isValidKey(key)
                Button { actionContext.bracket(key)} label: {
                    Text(key)
                        .frame(width: 30, height: 40)
                        .foregroundColor(isKeyEnable ? Color.white : Color.black)    // 文字色
                        .background(isKeyEnable ? Color.gray : Color.black.opacity(0.6))         // 背景色
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
    }
}

struct EnterKey: View {
    @EnvironmentObject var actionContext: KeyboardActionContext
    
    var body: some View {
        Button { actionContext.enter() } label: {
            Image(systemName: "return")
                .frame(width: 35, height: 30)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

struct SpaceKey: View {
    @EnvironmentObject var actionContext: KeyboardActionContext
    
    var body: some View {
        Button {
            actionContext.space()
        } label: {
            Image(systemName: "space")
                .frame(width: 30, height: 30)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

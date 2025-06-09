//
//  SuperscriptKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// 上付き文字キーボード
struct SuperscriptKeyboardView: View {
    @EnvironmentObject var shift: ShiftState      // Shift 状態（大文字切替）
    
    var body: some View {
        let isUpper = shift.state == .on     // Shift が ON ならアルファベットを大文字表示
        
        VStack {
            // 上付き数字行
            NumRow()
            
            // 演算子＋括弧行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","/"],
                bracketKeys: ["( )","{ }","[ ]"]
            )
            
            // アルファベット行（Shift で大文字表示）
            KeyRow(
                keys: isUpper ? ["Q","W","E","R","T","Y","U","I","O","P"]
                : ["q","w","e","r","t","y","u","i","o","p"]
            )
            KeyRow(
                keys: isUpper ? ["A","S","D","F","G","H","J","K","L"]
                : ["a","s","d","f","g","h","j","k","l"]
            )
            HStack {
                ShiftKeyButton()
                KeyRow(
                    keys: isUpper ? ["Z","X","C","V","B","N","M"]
                    : ["z","x","c","v","b","n","m"]
                )
                DeleteButton()
            }
        }
    }
}

// MARK: - プレビュー（Xcode Canvas用）
/// 入力アクションの挙動を print で確認可能
#Preview {
    SuperscriptKeyboardView()
    .environmentObject(ShiftState())
}

//
//  SubscriptKeyboardView.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

// MARK: - 下付き文字キーボードビュー
/// 数式や化学式で使われる下付き数字や文字を入力する専用レイアウト
struct SubscriptKeyboardView: View {
    @EnvironmentObject var shift: ShiftState
    @EnvironmentObject var actionContext: KeyboardActionContext
    let thisMode: KeyboardMode.Mode = .subscriptMode
    
    var body: some View {
        let isUpper = shift.state == .on   // Shift で大文字／小文字切替（下付き文字は数字のみなので行 1 へ影響なし）
        
        VStack {
            // 下付き数字行
            NumRow()
            
            // 演算子＋括弧行
            OperatorRow(
                opKeys: ["+","-","×","÷","=","/"],
                bracketKeys: ["( )","{ }","[ ]"],
                mode: thisMode
            )
            
            // アルファベット行（Shift で大文字表示）
            KeyRow(
                keys: isUpper ? ["Q","W","E","R","T","Y","U","I","O","P"]
                : ["q","w","e","r","t","y","u","i","o","p"],
                mode: thisMode,
                isShift: shift.isOn()
            )
            KeyRow(
                keys: isUpper ? ["A","S","D","F","G","H","J","K","L"]
                : ["a","s","d","f","g","h","j","k","l"],
                mode: thisMode,
                isShift: shift.isOn()
            )
            HStack {
                ShiftKeyButton()
                KeyRow(
                    keys: isUpper ? ["Z","X","C","V","B","N","M"]
                    : ["z","x","c","v","b","n","m"],
                    mode: thisMode,
                    isShift: shift.isOn()
                )
                DeleteButton()
            }
        }
        .environmentObject(actionContext)
    }
}


// MARK: - プレビュー（Xcode Canvas用）
/// 入力アクションの挙動を print で確認可能
#Preview {
    SubscriptKeyboardView()
    .environmentObject(ShiftState())
}

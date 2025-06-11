//
//  KeyboardView.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import SwiftUI
import UIKit

// MARK: - メインのキーボードビュー
struct KeyboardView: View {
    
    // 外部から渡されるパラメータ
    let needsInputModeSwitchKey: Bool       // 地球儀キーが必要かどうか
    let nextKeyboardAction: Selector        // 次のキーボードに切り替えるためのアクション
    
    @EnvironmentObject private var shift: ShiftState
    @EnvironmentObject private var keyboardMode: KeyboardMode
    @EnvironmentObject var actionContext: KeyboardActionContext // 各種入力アクション（テキスト挿入・削除・カーソル移動など）をまとめた共有オブジェクト
    
    var body: some View {
        
        VStack{
            // 現在のキーボードモードに応じて適切なサブキーボードを表示
            switch keyboardMode.current {
            case .default:
                DefaultKeyboardView()
                    .environmentObject(keyboardMode)
                    .environmentObject(shift)

            case .superscript:
                SuperscriptKeyboardView()
                    .environmentObject(keyboardMode)
                    .environmentObject(shift)

            case .subscriptMode:
                SubscriptKeyboardView()
                    .environmentObject(keyboardMode)
                    .environmentObject(shift)

            case .greek:
                GreekKeyboardView()
                    .environmentObject(keyboardMode)
                    .environmentObject(shift)

            case .math:
                MathKeyboardView()
                    .environmentObject(keyboardMode)
                    .environmentObject(shift)
            }
            // 下部のツールバー（モード切替ボタン、スペース、カーソル移動など）
            HStack{
                if needsInputModeSwitchKey {
                    // 地球儀ボタン（次のキーボードへ切り替え）
                    NextKeyboardButton(systemName: "globe",
                                       action: nextKeyboardAction)
                    .frame(width: 25, height: 30)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                // キーボードモード切り替えボタン群（現在のモードは灰色背景）
                KeyboardModeButton(mode: .default, currentMode: keyboardMode.current, setMode: { keyboardMode.current = $0 }) {
                    AnyView(Image(systemName: "character"))
                }
                KeyboardModeButton(mode: .subscriptMode, currentMode: keyboardMode.current, setMode: { keyboardMode.current = $0 }) {
                    AnyView(Image(systemName: "textformat.subscript"))
                }
                KeyboardModeButton(mode: .superscript, currentMode: keyboardMode.current, setMode: { keyboardMode.current = $0 }) {
                    AnyView(Image(systemName: "textformat.superscript"))
                }
                KeyboardModeButton(mode: .greek, currentMode: keyboardMode.current, setMode: { keyboardMode.current = $0 }) {
                    AnyView(Text("θ"))
                }
                KeyboardModeButton(mode: .math, currentMode: keyboardMode.current, setMode: { keyboardMode.current = $0 }) {
                    AnyView(Text("∫"))
                }

                // カーソル移動・スペース・改行などの操作ボタン
                Button(){
                    actionContext.moveCursorLeft()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 30, height: 30)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                SpaceKey()

                Button(){
                    actionContext.moveCursorRight()
                } label: {
                    Image(systemName: "chevron.forward")
                        .frame(width: 30, height: 30)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                EnterKey()
            }
        }
        .foregroundColor(Color.white)
        .frame(height: 300)
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(
            needsInputModeSwitchKey: true,
            nextKeyboardAction: Selector(("dummy"))
        )
        .environmentObject(ShiftState())
        .environmentObject(KeyboardMode())
        .environmentObject(KeyboardActionContext(shift: ShiftState(), keyboardMode: KeyboardMode()))
        .previewLayout(.sizeThatFits)
    }
}


private struct KeyboardModeButton: View {
    let mode: KeyboardMode.Mode
    let currentMode: KeyboardMode.Mode
    let setMode: (KeyboardMode.Mode) -> Void
    let content: () -> AnyView

    var body: some View {
        Button {
            setMode(mode)
        } label: {
            content()
                .frame(width: 30, height: 30)
                .foregroundColor(mode == currentMode ? Color.white : Color.primary)
                .background(mode == currentMode ? .black : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

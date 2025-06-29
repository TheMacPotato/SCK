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
    
    let defaultKeyboard: some View = DefaultKeyboardView()
    let superscriptKeyboard: some View = SuperscriptKeyboardView()
    let subscriptKeyboard: some View = SubscriptKeyboardView()
    let greekKeyboard: some View = GreekKeyboardView()
    let mathKeyboard: some View = MathKeyboardView()
    
    var body: some View {
        VStack {
            ZStack {
                defaultKeyboard
                    .opacity(keyboardMode.current == .default ? 1 : 0)
                superscriptKeyboard
                    .opacity(keyboardMode.current == .superscript ? 1 : 0)
                subscriptKeyboard
                    .opacity(keyboardMode.current == .subscriptMode ? 1 : 0)
                greekKeyboard
                    .opacity(keyboardMode.current == .greek ? 1 : 0)
                mathKeyboard
                    .opacity(keyboardMode.current == .math ? 1 : 0)
            }
            .environmentObject(keyboardMode)
            .environmentObject(shift)

            HStack {
                if needsInputModeSwitchKey {
                    NextKeyboardButton(systemName: "globe",
                                       action: nextKeyboardAction)
                    .frame(width: 25, height: 30)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                Picker("キーボード", selection: $keyboardMode.current) {
                    Image(systemName: "character").tag(KeyboardMode.Mode.default)
                    Image(systemName: "textformat.subscript").tag(KeyboardMode.Mode.subscriptMode)
                    Image(systemName: "textformat.superscript").tag(KeyboardMode.Mode.superscript)
                    Text("θ").tag(KeyboardMode.Mode.greek)
                    Text("∫").tag(KeyboardMode.Mode.math)
                }
                .pickerStyle(.segmented)

                Button {
                    actionContext.moveCursorLeft()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 30, height: 30)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                SpaceKey()

                Button {
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

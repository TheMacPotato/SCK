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
    let inputTextAction: (String) -> Void   // 入力処理
    let deleteTextAction: () -> Void        // 削除処理
    let moveRightAction: () -> Void         // カーソルを右へ移動
    let moveLeftAction: () -> Void          // カーソルを左へ移動
    
    @State private var keyboardMode: KeyboardMode = .default   // 現在のキーボードモード
    @StateObject private var shift = ShiftState()              // Shift状態の保持（大文字小文字）
    
    var body: some View {
        
        VStack{
            // 現在のキーボードモードに応じて適切なサブキーボードを表示
            switch keyboardMode {
            case .default:
                DefaultKeyboardView(
                    keyAction: keyAction(key:),
                    bracketAction: bracketAction(key:),
                    inputTextAction: inputTextAction,
                    deleteAction: deleteTextAction
                )
                .environmentObject(shift)

            case .superscript:
                SuperscriptKeyboardView(
                    keyAction: keyAction(key:),
                    bracketAction: bracketAction(key:),
                    inputTextAction: inputTextAction,
                    deleteAction: deleteTextAction
                )
                .environmentObject(shift)

            case .subscriptMode:
                SubscriptKeyboardView(
                    keyAction: keyAction(key:),
                    bracketAction: bracketAction(key:),
                    inputTextAction: inputTextAction,
                    deleteAction: deleteTextAction
                )
                .environmentObject(shift)

            case .greek:
                GreekKeyboardView(
                    keyAction: keyAction(key:),
                    bracketAction: bracketAction(key:),
                    inputTextAction: inputTextAction,
                    deleteAction: deleteTextAction
                )
                .environmentObject(shift)

            case .math:
                MathKeyboardView(
                    keyAction: keyAction(key:),
                    bracketAction: bracketAction(key:),
                    inputTextAction: inputTextAction,
                    deleteAction: deleteTextAction
                )
                .environmentObject(shift)
            }
            // 下部のツールバー（モード切替ボタン、スペース、カーソル移動など）
            HStack{
                if needsInputModeSwitchKey {
                    // 地球儀ボタン（次のキーボードへ切り替え）
                    NextKeyboardButton(systemName: "globe",
                                       action: nextKeyboardAction)
                    .frame(width: 25, height: 30)
                    .background(Color(uiColor: .darkGray))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                // キーボードモード切り替えボタン群（現在のモードは灰色背景）
                KeyboardModeButton(mode: .default, currentMode: keyboardMode, setMode: { keyboardMode = $0 }) {
                    AnyView(Image(systemName: "character"))
                }
                KeyboardModeButton(mode: .subscriptMode, currentMode: keyboardMode, setMode: { keyboardMode = $0 }) {
                    AnyView(Image(systemName: "textformat.subscript"))
                }
                KeyboardModeButton(mode: .superscript, currentMode: keyboardMode, setMode: { keyboardMode = $0 }) {
                    AnyView(Image(systemName: "textformat.superscript"))
                }
                KeyboardModeButton(mode: .greek, currentMode: keyboardMode, setMode: { keyboardMode = $0 }) {
                    AnyView(Text("θ"))
                }
                KeyboardModeButton(mode: .math, currentMode: keyboardMode, setMode: { keyboardMode = $0 }) {
                    AnyView(Text("∫"))
                }

                // カーソル移動・スペース・改行などの操作ボタン
                Button(){
                    moveLeftAction()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 30, height: 30)
                        .background(Color(uiColor: .darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Button {
                    inputTextAction(" ")
                } label: {
                    Image(systemName: "space")
                        .frame(width: 30, height: 30)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Button(){
                    moveRightAction()
                } label: {
                    Image(systemName: "chevron.forward")
                        .frame(width: 30, height: 30)
                        .background(Color(uiColor: .darkGray))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Button(){
                    inputTextAction("\n")
                } label: {
                    Image(systemName: "return.left")
                        .frame(width: 35, height: 30)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
            }
        }
        .foregroundColor(Color.white)
        .frame(height: 300)
    }

    
    // MARK: - 入力文字の変換処理（Shiftとモードに応じて切替）
    func inputTextChange(alphabet: String) -> String {
        switch keyboardMode {
        case .greek:
            // ギリシャ文字は小文字 / 大文字テーブルで変換
            if shift.state == .off {
                return greekKeys[alphabet] ?? alphabet
            } else {
                return greekShiftKeys[alphabet] ?? alphabet
            }
        case .math:
            // 数学モードではアルファベットはそのまま
            return alphabet
        default:
            // 通常・上付き・下付きでは Shift ON で大文字、OFF で小文字
            return shift.state == .off ? alphabet : alphabet.uppercased()
        }
    }
    
    
    // MARK: - 通常キー入力アクション（モードごとに処理を切り替え）
    func keyAction(key : String){
        switch keyboardMode {
        case .default:
            if shift.state == .off, let char = defaultKeys[key] {
                inputTextAction(char)
            } else if let char = defaultShiftKeys[key] {
                inputTextAction(char)
            }
        case .subscriptMode:
            if shift.state == .off, let char = subScriptKeys[key] {
                inputTextAction(char)
            } else if let char = subScriptShiftKeys[key] {
                inputTextAction(char)
            }
        case .superscript:
            if shift.state == .off, let char = superScriptKeys[key] {
                inputTextAction(char)
            } else if let char = superScriptShiftKeys[key] {
                inputTextAction(char)
            }
        case .greek:
            if shift.state == .off, let char = greekKeys[key] {
                inputTextAction(char)
            } else if let char = greekShiftKeys[key] {
                inputTextAction(char)
            }
        case .math:
            if shift.state == .off, let char = defaultKeys[key] {
                inputTextAction(char)
            } else if let char = defaultShiftKeys[key] {
                inputTextAction(char)
            }
        }
    }
    // MARK: - 括弧などの入力後にカーソルを戻す処理
    func bracketAction(key : String){
        switch keyboardMode {
        case .default:
            if shift.state == .off, let char = defaultKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            } else if let char = defaultShiftKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            }
        case .subscriptMode:
            if shift.state == .off, let char = subScriptKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            } else if let char = subScriptShiftKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            }
        case .superscript:
            if shift.state == .off, let char = superScriptKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            } else if let char = superScriptShiftKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            }
        case .greek:
            if shift.state == .off, let char = greekKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            } else if let char = greekShiftKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            }
        case .math:
            if shift.state == .off, let char = defaultKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            } else if let char = defaultShiftKeys[key] {
                inputTextAction(char)
                moveLeftAction()
            }
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(
            needsInputModeSwitchKey: true,
            nextKeyboardAction: Selector(("dummy")),
            inputTextAction: { _ in },
            deleteTextAction: {},
            moveRightAction: {},
            moveLeftAction: {}
        )
        .environmentObject(ShiftState())
        .previewLayout(.sizeThatFits)
    }
}


private struct KeyboardModeButton: View {
    let mode: KeyboardMode
    let currentMode: KeyboardMode
    let setMode: (KeyboardMode) -> Void
    let content: () -> AnyView

    var body: some View {
        Button {
            setMode(mode)
        } label: {
            content()
                .frame(width: 30, height: 30)
                .foregroundColor(mode == currentMode ? Color.white : Color.primary)
                .background(mode == currentMode ? Color(uiColor: .darkGray) : Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 4))
        }
    }
}

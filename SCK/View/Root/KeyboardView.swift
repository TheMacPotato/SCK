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
                }

                // キーボードモード切り替えボタン群（現在のモードは灰色背景）
                Button(){
                    keyboardMode = .default
                } label: {
                    if keyboardMode == .default {
                        Image(systemName: "character")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "character")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                Button(){
                    keyboardMode = .subscriptMode
                } label: {
                    if keyboardMode == .subscriptMode {
                        Image(systemName: "textformat.subscript")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "textformat.subscript")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                Button(){
                    keyboardMode = .superscript
                } label: {
                    if keyboardMode == .superscript {
                        Image(systemName: "textformat.superscript")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "textformat.superscript")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                Button(){
                    keyboardMode = .greek
                } label: {
                    if keyboardMode == .greek {
                        Text("θ")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Text("θ")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                Button(){
                    keyboardMode = .math
                } label: {
                    if keyboardMode == .math {
                        Text("∫")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Text("∫")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                // カーソル移動・スペース・改行などの操作ボタン
                Button(){
                    moveLeftAction()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 30, height: 30)
                        .background(Color(uiColor: .systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Button {
                    inputTextAction(" ")
                } label: {
                    Image(systemName: "space")
                        .frame(width: 30, height: 30)
                        .background(Color(uiColor: .systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                Button(){
                    moveRightAction()
                } label: {
                    Image(systemName: "chevron.forward")
                        .frame(width: 30, height: 30)
                        .background(Color(uiColor: .systemBackground))
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
        .foregroundColor(Color(uiColor: .label))
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
    
    // 以下、各モード用の文字変換辞書
    let defaultKeys: [String: String] = [
        "0": "0",
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "5": "5",
        "6": "6",
        "7": "7",
        "8": "8",
        "9": "9",
        
        "+": "+",
        "-": "-",
        "×": "×",
        "÷": "÷",
        "=": "=",
        "⇔": "⇔",
        "( )": "()",
        "{ }": "{}",
        "[ ]": "[]",
        
        "a": "a",
        "b": "b",
        "c": "c",
        "d": "d",
        "e": "e",
        "f": "f",
        "g": "g",
        "h": "h",
        "i": "i",
        "j": "j",
        "k": "k",
        "l": "l",
        "m": "m",
        "n": "n",
        "o": "o",
        "p": "p",
        "q": "q",
        "r": "r",
        "s": "s",
        "t": "t",
        "u": "u",
        "v": "v",
        "w": "w",
        "x": "x",
        "y": "y",
        "z": "z"
    ]
    
    let defaultShiftKeys: [String: String] = [
        "0": "0",
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "5": "5",
        "6": "6",
        "7": "7",
        "8": "8",
        "9": "9",
        
        "+": "+",
        "-": "-",
        "×": "×",
        "÷": "÷",
        "=": "=",
        "⇔": "⇔",
        "( )": "()",
        "{ }": "{}",
        "[ ]": "[]",
        
        "A": "A",
        "B": "B",
        "C": "C",
        "D": "D",
        "E": "E",
        "F": "F",
        "G": "G",
        "H": "H",
        "I": "I",
        "J": "J",
        "K": "K",
        "L": "L",
        "M": "M",
        "N": "N",
        "O": "O",
        "P": "P",
        "Q": "Q",
        "R": "R",
        "S": "S",
        "T": "T",
        "U": "U",
        "V": "V",
        "W": "W",
        "X": "X",
        "Y": "Y",
        "Z": "Z"
    ]
    
    let subScriptKeys: [String: String] = [
        "0": "₀",
        "1": "₁",
        "2": "₂",
        "3": "₃",
        "4": "₄",
        "5": "₅",
        "6": "₆",
        "7": "₇",
        "8": "₈",
        "9": "₉",
        
        "+": "₊",
        "-": "₋",
        "=": "₌",
        "( )":"₍₎",
        
        "a": "ₐ",
        "e": "ₑ",
        "h": "ₕ",
        "i": "ᵢ",
        "j": "ⱼ",
        "k": "ₖ",
        "l": "ₗ",
        "m": "ₘ",
        "n": "ₙ",
        "o": "ₒ",
        "p": "ₚ",
        "r": "ᵣ",
        "s": "ₛ",
        "t": "ₜ",
        "u": "ᵤ",
        "v": "ᵥ",
        "x": "ₓ"
    ]
    
    let subScriptShiftKeys : [String: String] = [
        "0": "₀",
        "1": "₁",
        "2": "₂",
        "3": "₃",
        "4": "₄",
        "5": "₅",
        "6": "₆",
        "7": "₇",
        "8": "₈",
        "9": "₉",
        
        "+": "₊",
        "-": "₋",
        "=": "₌",
        "( )":"₍₎",
    ]

    let superScriptKeys: [String: String] = [
        "0": "⁰",
        "1": "¹",
        "2": "²",
        "3": "³",
        "4": "⁴",
        "5": "⁵",
        "6": "⁶",
        "7": "⁷",
        "8": "⁸",
        "9": "⁹",
        
        "+": "⁺",
        "-": "⁻",
        "=": "⁼",
        "( )":"⁽⁾",
        
        "a": "ᵃ",
        "b": "ᵇ",
        "c": "ᶜ",
        "d": "ᵈ",
        "e": "ᵉ",
        "f": "ᶠ",
        "g": "ᵍ",
        "h": "ʰ",
        "i": "ⁱ",
        "j": "ʲ",
        "k": "ᵏ",
        "l": "ˡ",
        "m": "ᵐ",
        "n": "ⁿ",
        "o": "ᵒ",
        "p": "ᵖ",
        "r": "ʳ",
        "s": "ˢ",
        "t": "ᵗ",
        "u": "ᵘ",
        "v": "ᵛ",
        "w": "ʷ",
        "x": "ˣ",
        "y": "ʸ",
        "z": "ᶻ"
    ]

    let superScriptShiftKeys: [String: String] = [
        "0": "⁰",
        "1": "¹",
        "2": "²",
        "3": "³",
        "4": "⁴",
        "5": "⁵",
        "6": "⁶",
        "7": "⁷",
        "8": "⁸",
        "9": "⁹",
        
        "+": "⁺",
        "-": "⁻",
        "=": "⁼",
        "( )":"⁽⁾",
        
        "a": "ᴬ",
        "b": "ᴮ",
        "c": "ᶜ",
        "d": "ᴰ",
        "e": "ᴱ",
        "g": "ᴳ",
        "h": "ᴴ",
        "i": "ᴵ",
        "j": "ᴶ",
        "k": "ᴷ",
        "l": "ᴸ",
        "m": "ᴹ",
        "n": "ᴺ",
        "o": "ᴼ",
        "p": "ᴾ",
        "r": "ᴿ",
        "s": "ˢ",
        "t": "ᵀ",
        "u": "ᵁ",
        "v": "ⱽ",
        "w": "ᵂ",
        "x": "ˣ",
        "y": "ʸ",
        "z": "ᶻ"
    ]
    
    let greekKeys: [String: String] = [
        "0": "Ⅹ",
        "1": "Ⅰ",
        "2": "Ⅱ",
        "3": "Ⅲ",
        "4": "Ⅳ",
        "5": "Ⅴ",
        "6": "Ⅵ",
        "7": "Ⅶ",
        "8": "Ⅷ",
        "9": "Ⅸ",
        
        "+": "+",
        "-": "-",
        "×": "×",
        "÷": "÷",
        "=": "=",
        "⇔": "⇔",
        "( )": "()",
        "{ }": "{}",
        "[ ]": "[]",
        
        "a": "α",
        "b": "β",
        "c": "γ",
        "d": "δ",
        "e": "ε",
        "f": "φ",
        "g": "γ",
        "h": "η",
        "i": "ι",
        "j": "ϑ",
        "k": "κ",
        "l": "λ",
        "m": "μ",
        "n": "ν",
        "o": "ο",
        "p": "π",
        "q": "θ",
        "r": "ρ",
        "s": "σ",
        "t": "τ",
        "u": "υ",
        "v": "ϖ",
        "w": "ω",
        "x": "χ",
        "y": "ψ",
        "z": "ζ"
    ]
    
    let greekShiftKeys: [String: String] = [
        "0": "Ⅹ",
        "1": "Ⅰ",
        "2": "Ⅱ",
        "3": "Ⅲ",
        "4": "Ⅳ",
        "5": "Ⅴ",
        "6": "Ⅵ",
        "7": "Ⅶ",
        "8": "Ⅷ",
        "9": "Ⅸ",
        
        "+": "+",
        "-": "-",
        "×": "×",
        "÷": "÷",
        "=": "=",
        "⇔": "⇔",
        "( )": "()",
        "{ }": "{}",
        "[ ]": "[]",
        
        "a": "Α",
        "b": "Β",
        "c": "Γ",
        "d": "Δ",
        "e": "Ε",
        "f": "Φ",
        "g": "Γ",
        "h": "Η",
        "i": "Ι",
        "j": "Θ",
        "k": "Κ",
        "l": "Λ",
        "m": "Μ",
        "n": "Ν",
        "o": "Ο",
        "p": "Π",
        "q": "Θ",
        "r": "Ρ",
        "s": "Σ",
        "t": "Τ",
        "u": "Υ",
        "v": "ϖ",
        "w": "Ω",
        "x": "Χ",
        "y": "Ψ",
        "z": "Ζ"
    ]
        
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


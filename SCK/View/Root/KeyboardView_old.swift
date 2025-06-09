//
//  KeyboardView.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import SwiftUI
import UIKit

struct KeyboardView_old: View {
    
    let needsInputModeSwitchKey: Bool
    let nextKeyboardAction: Selector
    let inputTextAction: (String) -> Void
    let deleteTextAction: () -> Void
    let moveRightAction: () -> Void
    let moveLeftAction: () -> Void
    @State var keyboardMode: KeyboardMode = .default
    
    
    @State var shiftSwitch = 0
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Group {
                    
                    // Input Text
                    Button {
                        keyAction_old(key: "1")
                    } label: {
                        keyDisplay_old(keyString: "1")
                    }
                    
                    Button {
                        keyAction_old(key: "2")
                    } label: {
                        keyDisplay_old(keyString: "2")
                    }
                    
                    Button {
                        keyAction_old(key: "3")
                    } label: {
                        keyDisplay_old(keyString: "3")
                    }
                    
                    Button {
                        keyAction_old(key: "4")
                    } label: {
                        keyDisplay_old(keyString: "4")
                    }
                    
                    Button {
                        keyAction_old(key: "5")
                    } label: {
                        keyDisplay_old(keyString: "5")
                    }
                    
                    Button {
                        keyAction_old(key: "6")
                    } label: {
                        keyDisplay_old(keyString: "6")
                    }
                    
                    Button {
                        keyAction_old(key: "7")
                    } label: {
                        keyDisplay_old(keyString: "7")
                    }
                    
                    Button {
                        keyAction_old(key: "8")
                    } label: {
                        keyDisplay_old(keyString: "8")
                    }
                    
                    Button {
                        keyAction_old(key: "9")
                    } label: {
                        keyDisplay_old(keyString: "9")
                    }
                    
                    Button {
                        keyAction_old(key: "0")
                    } label: {
                        keyDisplay_old(keyString: "0")
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        keyAction_old(key: "+")
                    } label: {
                        keyDisplay_old(keyString: "+")
                    }
                    
                    Button {
                        keyAction_old(key: "-")
                    } label: {
                        keyDisplay_old(keyString: "-")
                    }
                    
                    Button {
                        keyAction_old(key: "×")
                    } label: {
                        keyDisplay_old(keyString: "×")
                    }
                    
                    Button {
                        keyAction_old(key: "÷")
                    } label: {
                        keyDisplay_old(keyString: "÷")
                    }
                    
                    Button {
                        keyAction_old(key: "=")
                    } label: {
                        keyDisplay_old(keyString:"=")
                    }
                    
                    Button {
                        keyAction_old(key: "⇔")
                    } label: {
                        keyDisplay_old(keyString:"⇔")
                    }
                    
                    Button {
                        bracketAction_old(key: "()")
                    } label: {
                        keyDisplay_old(keyString: "( )")
                    }
                    
                    Button {
                        bracketAction_old(key: "{}")
                    } label: {
                        keyDisplay_old(keyString: "{ }")
                    }
                    
                    Button {
                        bracketAction_old(key: "[]")
                    } label: {
                        keyDisplay_old(keyString: "[ ]")
                    }
                    
                    Button {
                        inputTextAction("/")
                    } label: {
                        Text("/")
                            .frame(width: 30, height: 40)
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if keyboardMode != .math {
                        Button {
                            keyAction_old(key: "q")
                        } label: {
                            keyDisplay_old(keyString: "q")
                        }
                        Button {
                            keyAction_old(key: "w")
                        } label: {
                            keyDisplay_old(keyString: "w")
                        }
                        Button {
                            keyAction_old(key: "e")
                        } label: {
                            keyDisplay_old(keyString: "e")
                        }
                        Button {
                            keyAction_old(key: "r")
                        } label: {
                            keyDisplay_old(keyString: "r")
                        }
                        Button {
                            keyAction_old(key: "t")
                        } label: {
                            keyDisplay_old(keyString: "t")
                        }
                        Button {
                            keyAction_old(key: "y")
                        } label: {
                            keyDisplay_old(keyString: "y")
                        }
                        Button {
                            keyAction_old(key: "u")
                        } label: {
                            keyDisplay_old(keyString: "u")
                        }
                        Button {
                            keyAction_old(key: "i")
                        } label: {
                            keyDisplay_old(keyString: "i")
                        }
                        Button {
                            keyAction_old(key: "o")
                        } label: {
                            keyDisplay_old(keyString: "o")
                        }
                        Button {
                            keyAction_old(key: "p")
                        } label: {
                            keyDisplay_old(keyString: "p")
                        }
                    } else if keyboardMode == .math {
                        Button {
                            inputTextAction("±")
                        } label: {
                            Text("±")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∓")
                        } label: {
                            Text("∓")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("≠")
                        } label: {
                            Text("≠")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("≈")
                        } label: {
                            Text("≈")
                                .frame(width: 30, height: 40)
                        }
                        
                        Button {
                            inputTextAction("≤")
                        } label: {
                            Text("≤")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("≥")
                        } label: {
                            Text("≥")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("<")
                        } label: {
                            Text("<")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction(">")
                        } label: {
                            Text(">")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("≪")
                        } label: {
                            Text("≪")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("≫")
                        } label: {
                            Text("≫")
                                .frame(width: 30, height: 40)
                        }
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if keyboardMode != .math {
                        Button {
                            keyAction_old(key: "a")
                        } label: {
                            keyDisplay_old(keyString: "a")
                        }
                        Button {
                            keyAction_old(key: "s")
                        } label: {
                            keyDisplay_old(keyString: "s")
                        }
                        Button {
                            keyAction_old(key: "d")
                        } label: {
                            keyDisplay_old(keyString: "d")
                        }
                        Button {
                            keyAction_old(key: "f")
                        } label: {
                            keyDisplay_old(keyString: "f")
                        }
                        Button {
                            keyAction_old(key: "g")
                        } label: {
                            keyDisplay_old(keyString: "g")
                        }
                        Button {
                            keyAction_old(key: "h")
                        } label: {
                            keyDisplay_old(keyString: "h")
                        }
                        Button {
                            keyAction_old(key: "j")
                        } label: {
                            keyDisplay_old(keyString: "j")
                        }
                        Button {
                            keyAction_old(key: "k")
                        } label: {
                            keyDisplay_old(keyString: "k")
                        }
                        Button {
                            keyAction_old(key: "l")
                        } label: {
                            keyDisplay_old(keyString: "l")
                        }
                            
                    } else if keyboardMode == .math {
                        Button {
                            inputTextAction("∅")
                        } label: {
                            Text("∅")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∞")
                        } label: {
                            Text("∞")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∫")
                        } label: {
                            Text("∫")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∂")
                        } label: {
                            Text("∂")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("√")
                        } label: {
                            Text("√")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∑")
                        } label: {
                            Text("∑")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∏")
                        } label: {
                            Text("∏")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∐")
                        } label: {
                            Text("∐")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∆")
                        } label: {
                            Text("∆")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∇")
                        } label: {
                            Text("∇")
                                .frame(width: 30, height: 40)
                        }
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        if shiftSwitch == 1 {
                            shiftSwitch = 0
                        } else {
                            shiftSwitch = 1
                        }
                    } label: {
                        if shiftSwitch == 1 {
                            Image(systemName: "shift")
                                .frame(width: 44, height: 40)
                                .foregroundColor(Color.white)
                                .background(Color.gray)
                        } else {
                            Image(systemName: "shift")
                                .frame(width: 44, height: 40)
                        }
                    }
                    if keyboardMode != .math {
                        Button {
                            keyAction_old(key: "z")
                        } label: {
                            keyDisplay_old(keyString: "z")
                        }
                        Button {
                            keyAction_old(key: "x")
                        } label: {
                            keyDisplay_old(keyString: "x")
                        }
                        Button {
                            keyAction_old(key: "c")
                        } label: {
                            keyDisplay_old(keyString: "c")
                        }
                        Button {
                            keyAction_old(key: "v")
                        } label: {
                            keyDisplay_old(keyString: "v")
                        }
                        Button {
                            keyAction_old(key: "b")
                        } label: {
                            keyDisplay_old(keyString: "b")
                        }
                        Button {
                            keyAction_old(key: "n")
                        } label: {
                            keyDisplay_old(keyString: "n")
                        }
                        Button {
                            keyAction_old(key: "m")
                        } label: {
                            keyDisplay_old(keyString: "m")
                        }
                    } else if keyboardMode == .math {
                        Button {
                            inputTextAction("∴")
                        } label: {
                            Text("∴")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∵")
                        } label: {
                            Text("∵")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∧")
                        } label: {
                            Text("∧")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("∨")
                        } label: {
                            Text("∨")
                                .frame(width: 30, height: 40)
                        }
                        Button {
                            inputTextAction("||")
                            moveLeftAction()
                        } label: {
                            Text("|x|")
                                .frame(width: 30, height: 40)
                        }
                        
                        if shiftSwitch == 0 {
                            Button {
                                inputTextAction("→")
                            } label: {
                                Text("→")
                                    .frame(width: 30, height: 40)
                            }
                        }else if shiftSwitch == 1 {
                            Button {
                                inputTextAction("←")
                            } label: {
                                Text("←")
                                    .frame(width: 30, height: 40)
                            }
                        }
                        
                        Button {
                            inputTextAction("≡")
                        } label: {
                            Text("≡")
                                .frame(width: 30, height: 40)
                        }
                    }
                    // Delete Text
                    Button {
                        deleteTextAction()
                    } label: {
                        Image(systemName: "delete.left")
                            .frame(width: 44, height: 40)
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                // Next Keybaord
                if needsInputModeSwitchKey {
                    NextKeyboardButton(systemName: "globe",
                                       action: nextKeyboardAction)
                    .frame(width: 25, height: 30)
                }

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
    
    func keyDisplay_old(keyString : String) -> some View {
        switch keyboardMode {
        case .default:
            if shiftSwitch == 0 {
                return Text(defaultKeys[keyString]!)
                    .frame(width: 30, height: 40)
            } else {
                return Text(defaultShiftKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
        case .subscriptMode:
            if shiftSwitch == 0 {
                if subScriptKeys[keyString] == nil {
                    return Text(defaultKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if subScriptShiftKeys[keyString] == nil {
                    return Text(defaultShiftKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultShiftKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            }
        case .superscript:
            if shiftSwitch == 0 {
                if superScriptKeys[keyString] == nil {
                    return Text(defaultKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if superScriptShiftKeys[keyString] == nil {
                    return Text(defaultShiftKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultShiftKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            }
        case .greek:
            if shiftSwitch == 0 {
                if greekKeys[keyString] == nil {
                    return Text(greekKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(greekKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if greekShiftKeys[keyString] == nil {
                    return Text(greekShiftKeys[keyString]!)
                        .strikethrough(color: Color.red)
                        .frame(width: 30, height: 40)
                } else {
                    return Text(greekShiftKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            }
        case .math:
            if shiftSwitch == 0 {
                return Text(defaultKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
            else {
                return Text(defaultShiftKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
        }
    }
    
    func inputTextChange_old(alphabet : String) -> String {
        if keyboardMode == .greek && shiftSwitch == 0{
            return greekKeys[alphabet]!
        } else if keyboardMode != .greek && keyboardMode != .math {
            if shiftSwitch == 0 {
                return alphabet
            } else if shiftSwitch == 1 {
                return alphabet
            }
            return "X"
        } else {
            return "X"
        }
    }
    
    func keyAction_old(key : String){
        switch keyboardMode {
        case .default:
            if shiftSwitch == 0 && defaultKeys [key] != nil {
                inputTextAction(defaultKeys [key]!)
            } else if defaultShiftKeys [key] != nil {
                inputTextAction(defaultShiftKeys [key]!)
            }
        case .subscriptMode:
            if shiftSwitch == 0 && subScriptKeys [key] != nil {
                inputTextAction(subScriptKeys [key]!)
            } else if subScriptShiftKeys [key] != nil {
                inputTextAction(subScriptShiftKeys [key]!)
            }
        case .superscript:
            if shiftSwitch == 0 && superScriptKeys [key] != nil {
                inputTextAction(superScriptKeys [key]!)
            } else if superScriptShiftKeys [key] != nil {
                inputTextAction(superScriptShiftKeys [key]!)
            }
        case .greek:
            if shiftSwitch == 0 && greekKeys [key] != nil {
                inputTextAction(greekKeys [key]!)
            } else if greekShiftKeys [key] != nil {
                inputTextAction(greekShiftKeys [key]!)
            }
        case .math:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
            } else {
                inputTextAction(defaultShiftKeys [key]!)
            }
        }
    }
    
    func bracketAction_old(key : String){
        switch keyboardMode {
        case .default:
            if shiftSwitch == 0 && defaultKeys [key] != nil {
                inputTextAction(defaultKeys [key]!)
                moveLeftAction()
            } else if defaultShiftKeys [key] != nil {
                inputTextAction(defaultShiftKeys [key]!)
                moveLeftAction()
            }
        case .subscriptMode:
            if shiftSwitch == 0 && subScriptKeys [key] != nil {
                inputTextAction(subScriptKeys [key]!)
                moveLeftAction()
            } else if subScriptShiftKeys [key] != nil {
                inputTextAction(subScriptShiftKeys [key]!)
                moveLeftAction()
            }
        case .superscript:
            if shiftSwitch == 0 && superScriptKeys [key] != nil {
                inputTextAction(superScriptKeys [key]!)
                moveLeftAction()
            } else if superScriptShiftKeys [key] != nil {
                inputTextAction(superScriptShiftKeys [key]!)
                moveLeftAction()
            }
        case .greek:
            if shiftSwitch == 0 && greekKeys [key] != nil {
                inputTextAction(greekKeys [key]!)
                moveLeftAction()
            } else if greekShiftKeys [key] != nil {
                inputTextAction(greekShiftKeys [key]!)
                moveLeftAction()
            }
        case .math:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
                moveLeftAction()
            } else {
                inputTextAction(defaultShiftKeys [key]!)
                moveLeftAction()
            }
        }
    }
    
    
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
        
        "a": "A",
        "b": "B",
        "c": "C",
        "d": "D",
        "e": "E",
        "f": "F",
        "g": "G",
        "h": "H",
        "i": "I",
        "j": "J",
        "k": "K",
        "l": "L",
        "m": "M",
        "n": "N",
        "o": "O",
        "p": "P",
        "q": "Q",
        "r": "R",
        "s": "S",
        "t": "T",
        "u": "U",
        "v": "V",
        "w": "W",
        "x": "X",
        "y": "Y",
        "z": "Z"
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

struct KeyboardView_old_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView_old(needsInputModeSwitchKey: true, nextKeyboardAction: Selector(("dummy"))) { _ in } deleteTextAction: {} moveRightAction: {} moveLeftAction: {}
    }
    
}


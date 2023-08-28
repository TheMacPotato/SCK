//
//  KeyboardView.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import SwiftUI
import UIKit

struct KeyboardView: View {
    
    let needsInputModeSwitchKey: Bool
    let nextKeyboardAction: Selector
    let inputTextAction: (String) -> Void
    let deleteTextAction: () -> Void
    let moveRightAction: () -> Void
    let moveLeftAction: () -> Void
    @State var KeyboardNumber: Int = 0
    // 0 = default, 1 = subScript, 2 = superScript, 3 = greek, 4 = math
    
    
    @State var shiftSwitch = 0
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Group {
                    
                    // Input Text
                    Button {
                        keyAction(key: "1")
                    } label: {
                        keyDisplay(keyString: "1")
                    }
                    
                    Button {
                        keyAction(key: "2")
                    } label: {
                        keyDisplay(keyString: "2")
                    }
                    
                    Button {
                        keyAction(key: "3")
                    } label: {
                        keyDisplay(keyString: "3")
                    }
                    
                    Button {
                        keyAction(key: "4")
                    } label: {
                        keyDisplay(keyString: "4")
                    }
                    
                    Button {
                        keyAction(key: "5")
                    } label: {
                        keyDisplay(keyString: "5")
                    }
                    
                    Button {
                        keyAction(key: "6")
                    } label: {
                        keyDisplay(keyString: "6")
                    }
                    
                    Button {
                        keyAction(key: "7")
                    } label: {
                        keyDisplay(keyString: "7")
                    }
                    
                    Button {
                        keyAction(key: "8")
                    } label: {
                        keyDisplay(keyString: "8")
                    }
                    
                    Button {
                        keyAction(key: "9")
                    } label: {
                        keyDisplay(keyString: "9")
                    }
                    
                    Button {
                        keyAction(key: "0")
                    } label: {
                        keyDisplay(keyString: "0")
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        keyAction(key: "+")
                    } label: {
                        keyDisplay(keyString: "+")
                    }
                    
                    Button {
                        keyAction(key: "-")
                    } label: {
                        keyDisplay(keyString: "-")
                    }
                    
                    Button {
                        keyAction(key: "×")
                    } label: {
                        keyDisplay(keyString: "×")
                    }
                    
                    Button {
                        keyAction(key: "÷")
                    } label: {
                        keyDisplay(keyString: "÷")
                    }
                    
                    Button {
                        keyAction(key: "=")
                    } label: {
                        keyDisplay(keyString:"=")
                    }
                    
                    Button {
                        keyAction(key: "⇔")
                    } label: {
                        keyDisplay(keyString:"⇔")
                    }
                    
                    Button {
                        bracketAction(key: "()")
                    } label: {
                        Text("( )")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        bracketAction(key: "{}")
                    } label: {
                        Text("{ }")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        bracketAction(key: "[]")
                    } label: {
                        Text("[ ]")
                            .frame(width: 30, height: 40)
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
                    if KeyboardNumber != 4 {
                        Button {
                            keyAction(key: "q")
                        } label: {
                            keyDisplay(keyString: "q")
                        }
                        Button {
                            keyAction(key: "w")
                        } label: {
                            keyDisplay(keyString: "w")
                        }
                        Button {
                            keyAction(key: "e")
                        } label: {
                            keyDisplay(keyString: "e")
                        }
                        Button {
                            keyAction(key: "r")
                        } label: {
                            keyDisplay(keyString: "r")
                        }
                        Button {
                            keyAction(key: "t")
                        } label: {
                            keyDisplay(keyString: "t")
                        }
                        Button {
                            keyAction(key: "y")
                        } label: {
                            keyDisplay(keyString: "y")
                        }
                        Button {
                            keyAction(key: "u")
                        } label: {
                            keyDisplay(keyString: "u")
                        }
                        Button {
                            keyAction(key: "i")
                        } label: {
                            keyDisplay(keyString: "i")
                        }
                        Button {
                            keyAction(key: "o")
                        } label: {
                            keyDisplay(keyString: "o")
                        }
                        Button {
                            keyAction(key: "p")
                        } label: {
                            keyDisplay(keyString: "p")
                        }
                    } else if KeyboardNumber == 4 {
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
                    if KeyboardNumber != 4 {
                        Button {
                            keyAction(key: "a")
                        } label: {
                            keyDisplay(keyString: "a")
                        }
                        Button {
                            keyAction(key: "s")
                        } label: {
                            keyDisplay(keyString: "s")
                        }
                        Button {
                            keyAction(key: "d")
                        } label: {
                            keyDisplay(keyString: "d")
                        }
                        Button {
                            keyAction(key: "f")
                        } label: {
                            keyDisplay(keyString: "f")
                        }
                        Button {
                            keyAction(key: "g")
                        } label: {
                            keyDisplay(keyString: "g")
                        }
                        Button {
                            keyAction(key: "h")
                        } label: {
                            keyDisplay(keyString: "h")
                        }
                        Button {
                            keyAction(key: "j")
                        } label: {
                            keyDisplay(keyString: "j")
                        }
                        Button {
                            keyAction(key: "k")
                        } label: {
                            keyDisplay(keyString: "k")
                        }
                        Button {
                            keyAction(key: "l")
                        } label: {
                            keyDisplay(keyString: "l")
                        }
                            
                    } else if KeyboardNumber == 4 {
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
                    if KeyboardNumber != 4 {
                        Button {
                            keyAction(key: "z")
                        } label: {
                            keyDisplay(keyString: "z")
                        }
                        Button {
                            keyAction(key: "x")
                        } label: {
                            keyDisplay(keyString: "x")
                        }
                        Button {
                            keyAction(key: "c")
                        } label: {
                            keyDisplay(keyString: "c")
                        }
                        Button {
                            keyAction(key: "v")
                        } label: {
                            keyDisplay(keyString: "v")
                        }
                        Button {
                            keyAction(key: "b")
                        } label: {
                            keyDisplay(keyString: "b")
                        }
                        Button {
                            keyAction(key: "n")
                        } label: {
                            keyDisplay(keyString: "n")
                        }
                        Button {
                            keyAction(key: "m")
                        } label: {
                            keyDisplay(keyString: "m")
                        }
                    } else if KeyboardNumber == 4 {
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
                    KeyboardNumber = 0
                } label: {
                    if KeyboardNumber == 0 {
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
                    KeyboardNumber = 1
                } label: {
                    if KeyboardNumber == 1 {
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
                    KeyboardNumber = 2
                } label: {
                    if KeyboardNumber == 2 {
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
                    KeyboardNumber = 3
                } label: {
                    if KeyboardNumber == 3 {
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
                    KeyboardNumber = 4
                } label: {
                    if KeyboardNumber == 4 {
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
    
    func keyDisplay(keyString : String) -> some View {
        switch KeyboardNumber {
        case 0:
            if shiftSwitch == 0 {
                return Text(defaultKeys[keyString]!)
                    .frame(width: 30, height: 40)
            } else {
                return Text(defaultShiftKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
        case 1:
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
        case 2:
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
        case 3:
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
        case 4:
            if shiftSwitch == 0 {
                return Text(defaultKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
            else {
                return Text(defaultShiftKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
        case 5:
            if shiftSwitch == 0 {
                return Text(defaultKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
            else {
                return Text(defaultShiftKeys[keyString]!)
                    .frame(width: 30, height: 40)
            }
        default:
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
    
    func inputTextChange(alphabet : String) -> String {
        if KeyboardNumber == 3 && shiftSwitch == 0{
            return greekKeys[alphabet]!
        } else if KeyboardNumber != 3 && KeyboardNumber != 4 && KeyboardNumber != 5 {
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
    
    func keyAction(key : String){
        switch KeyboardNumber {
        case 0:
            if shiftSwitch == 0 && defaultKeys [key] != nil {
                inputTextAction(defaultKeys [key]!)
            } else if defaultShiftKeys [key] != nil {
                inputTextAction(defaultShiftKeys [key]!)
            }
        case 1:
            if shiftSwitch == 0 && subScriptKeys [key] != nil {
                inputTextAction(subScriptKeys [key]!)
            } else if subScriptShiftKeys [key] != nil {
                inputTextAction(subScriptShiftKeys [key]!)
            }
        case 2:
            if shiftSwitch == 0 && superScriptKeys [key] != nil {
                inputTextAction(superScriptKeys [key]!)
            } else if superScriptShiftKeys [key] != nil {
                inputTextAction(superScriptShiftKeys [key]!)
            }
        case 3:
            if shiftSwitch == 0 && greekKeys [key] != nil {
                inputTextAction(greekKeys [key]!)
            } else if greekKeys [key] != nil {
                inputTextAction(greekShiftKeys [key]!)
            }
        case 4:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
            } else {
                inputTextAction(defaultShiftKeys [key]!)
            }
        case 5:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
            } else {
                inputTextAction(defaultShiftKeys [key]!)
            }
        default:
            inputTextAction("X")
        }
    }
    
    func bracketAction(key : String){
        switch KeyboardNumber {
        case 0:
            if shiftSwitch == 0 && defaultKeys [key] != nil {
                inputTextAction(defaultKeys [key]!)
                moveLeftAction()
            } else if defaultShiftKeys [key] != nil {
                inputTextAction(defaultShiftKeys [key]!)
                moveLeftAction()
            }
        case 1:
            if shiftSwitch == 0 && subScriptKeys [key] != nil {
                inputTextAction(subScriptKeys [key]!)
                moveLeftAction()
            } else if subScriptShiftKeys [key] != nil {
                inputTextAction(subScriptShiftKeys [key]!)
                moveLeftAction()
            }
        case 2:
            if shiftSwitch == 0 && superScriptKeys [key] != nil {
                inputTextAction(superScriptKeys [key]!)
                moveLeftAction()
            } else if superScriptShiftKeys [key] != nil {
                inputTextAction(superScriptShiftKeys [key]!)
                moveLeftAction()
            }
        case 3:
            if shiftSwitch == 0 && greekKeys [key] != nil {
                inputTextAction(greekKeys [key]!)
                moveLeftAction()
            } else if greekKeys [key] != nil {
                inputTextAction(greekShiftKeys [key]!)
                moveLeftAction()
            }
        case 4:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
                moveLeftAction()
            } else {
                inputTextAction(defaultShiftKeys [key]!)
                moveLeftAction()
            }
        case 5:
            if shiftSwitch == 0 {
                inputTextAction(defaultKeys [key]!)
                moveLeftAction()
            } else {
                inputTextAction(defaultShiftKeys [key]!)
                moveLeftAction()
            }
        default:
            inputTextAction("X")
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
        "()": "()",
        "{}": "{}",
        "[]": "[]",
        
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
        "()": "()",
        "{}": "{}",
        "[]": "[]",
        
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
        "()":"₍₎",
        
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
        "()":"₍₎",
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
        "()":"⁽⁾",
        
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
        "()":"⁽⁾",
        
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
        "()": "()",
        "{}": "{}",
        "[]": "[]",
        
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
        "()": "()",
        "{}": "{}",
        "[]": "[]",
        
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
        KeyboardView(needsInputModeSwitchKey: true, nextKeyboardAction: Selector(("dummy"))) { _ in } deleteTextAction: {} moveRightAction: {} moveLeftAction: {}
    }
    
}


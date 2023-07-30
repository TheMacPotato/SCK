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
    // 0 = default, 1 = subScript, 2 = superScript, 3 = greek, 4 = math, 5 = science
    
    @State var shiftSwitch = 0
    
    @State var key0 = "0"
    @State var key1 = "1"
    @State var key2 = "2"
    @State var key3 = "3"
    @State var key4 = "4"
    @State var key5 = "5"
    @State var key6 = "6"
    @State var key7 = "7"
    @State var key8 = "8"
    @State var key9 = "9"
    
    @State var keyA = "a"
    @State var keyB = "b"
    @State var keyC = "c"
    @State var keyD = "d"
    @State var keyE = "e"
    @State var keyF = "f"
    @State var keyG = "g"
    @State var keyH = "h"
    @State var keyI = "i"
    @State var keyJ = "j"
    @State var keyK = "k"
    @State var keyL = "l"
    @State var keyM = "m"
    @State var keyN = "n"
    @State var keyO = "o"
    @State var keyP = "p"
    @State var keyQ = "q"
    @State var keyR = "r"
    @State var keyS = "s"
    @State var keyT = "t"
    @State var keyU = "u"
    @State var keyV = "v"
    @State var keyW = "w"
    @State var keyX = "x"
    @State var keyY = "y"
    @State var keyZ = "z"
     
    
    @State var keyPlas = "+"
    @State var keyMinus = "-"
    @State var keyEqual = "="
    @State var exclamation = "!"
    @State var keyBracketsS = "("
    @State var keyBracketsE = ")"
    @State var keyBracketsMidS = "{"
    @State var keyBracketsMidE = "}"
    @State var keyBracketsBigS = "["
    @State var keyBracketsBigE = "]"
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Group {
                    
                    // Input Text
                    
                    if KeyboardNumber != 4 && KeyboardNumber != 5{
                        Button {
                            inputTextAction(inputTextChange(alphabet: key1))
                        } label: {
                            keyDisplay(keyString: "1")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key2))
                        } label: {
                            keyDisplay(keyString: "2")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key3))
                        } label: {
                            keyDisplay(keyString: "3")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key4))
                        } label: {
                            keyDisplay(keyString: "4")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key5))
                        } label: {
                            keyDisplay(keyString: "5")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key6))
                        } label: {
                            keyDisplay(keyString: "6")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key7))
                        } label: {
                            keyDisplay(keyString: "7")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key8))
                        } label: {
                            keyDisplay(keyString: "8")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key9))
                        } label: {
                            keyDisplay(keyString: "9")
                        }
                        
                        Button {
                            inputTextAction(inputTextChange(alphabet: key0))
                        } label: {
                            keyDisplay(keyString: "0")
                        }
                    } else if KeyboardNumber == 4 {
                        
                    } else if KeyboardNumber == 5 {
                        
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        inputTextAction(keyPlas)
                    } label: {
                        Text("+")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyMinus)
                    } label: {
                        Text("-")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyEqual)
                    } label: {
                        Text("=")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsS)
                    } label: {
                        Text("(")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsE)
                    } label: {
                        Text(")")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsMidS)
                    } label: {
                        Text("{")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsMidE)
                    } label: {
                        Text("}")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsBigS)
                    } label: {
                        Text("[")
                            .frame(width: 30, height: 40)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsBigE)
                    } label: {
                        Text("]")
                            .frame(width: 30, height: 40)
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if KeyboardNumber != 4 && KeyboardNumber != 5{
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyQ))
                        } label: {
                            keyDisplay(keyString: "q")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyW))
                        } label: {
                            keyDisplay(keyString: "w")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyE))
                        } label: {
                            keyDisplay(keyString: "e")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyR))
                        } label: {
                            keyDisplay(keyString: "r")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyT))
                        } label: {
                            keyDisplay(keyString: "t")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyY))
                        } label: {
                            keyDisplay(keyString: "y")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyU))
                        } label: {
                            keyDisplay(keyString: "u")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyI))
                        } label: {
                            keyDisplay(keyString: "i")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyO))
                        } label: {
                            keyDisplay(keyString: "o")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyP))
                        } label: {
                            keyDisplay(keyString: "p")
                        }
                    } else if KeyboardNumber == 4 {
                        
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if KeyboardNumber != 4 && KeyboardNumber != 5 {
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyA))
                        } label: {
                            keyDisplay(keyString: "a")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyS))
                        } label: {
                            keyDisplay(keyString: "s")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyD))
                        } label: {
                            keyDisplay(keyString: "d")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyF))
                        } label: {
                            keyDisplay(keyString: "f")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyG))
                        } label: {
                            keyDisplay(keyString: "g")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyH))
                        } label: {
                            keyDisplay(keyString: "h")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyJ))
                        } label: {
                            keyDisplay(keyString: "j")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyK))
                        } label: {
                            keyDisplay(keyString: "k")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyL))
                        } label: {
                            keyDisplay(keyString: "l")
                        }
                            
                    } else if KeyboardNumber == 4 {
                        
                    } else if KeyboardNumber == 5 {
                        
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if KeyboardNumber != 4 && KeyboardNumber != 5 {
                        
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
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyZ))
                        } label: {
                            keyDisplay(keyString: "z")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyX))
                        } label: {
                            keyDisplay(keyString: "x")
                        }
                        Button {
                            inputTextAction(keyC)
                        } label: {
                            keyDisplay(keyString: "c")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyV))
                        } label: {
                            keyDisplay(keyString: "v")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyB))
                        } label: {
                            keyDisplay(keyString: "b")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyN))
                        } label: {
                            keyDisplay(keyString: "n")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyM))
                        } label: {
                            keyDisplay(keyString: "m")
                        }
                        // Delete Text
                        Button {
                            deleteTextAction()
                        } label: {
                            Image(systemName: "delete.left")
                                .frame(width: 44, height: 40)
                        }
                    } else if KeyboardNumber == 4 {
                        
                    } else if KeyboardNumber == 5 {
                        
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
                    .frame(width: 30, height: 30)
                }
                
                Button(){
                    KeyboardNumber = 0
                    buttonAction()
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
                    buttonAction()
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
                    buttonAction()
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
                    buttonAction()
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
                    buttonAction()
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
                    KeyboardNumber = 5
                    buttonAction()
                } label: {
                    if KeyboardNumber == 5 {
                        Image(systemName: "testtube.2")
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "testtube.2")
                            .frame(width: 30, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                Button(){
                    moveLeftAction()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 25, height: 30)
                        .background(Color(uiColor: .systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }
                
                Button(){
                    moveRightAction()
                } label: {
                    Image(systemName: "chevron.forward")
                        .frame(width: 25, height: 30)
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
                        .strikethrough()
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if subScriptShiftKeys[keyString] == nil {
                    return Text(defaultShiftKeys[keyString]!)
                        .strikethrough()
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
                        .strikethrough()
                        .frame(width: 30, height: 40)
                } else {
                    return Text(defaultKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if superScriptShiftKeys[keyString] == nil {
                    return Text(defaultShiftKeys[keyString]!)
                        .strikethrough()
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
                        .strikethrough()
                        .frame(width: 30, height: 40)
                } else {
                    return Text(greekKeys[keyString]!)
                        .frame(width: 30, height: 40)
                }
            } else {
                if greekShiftKeys[keyString] == nil {
                    return Text(greekShiftKeys[keyString]!)
                        .strikethrough()
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
        
        "+":"+",
        "-":"-",
        "=":"=",
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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
        
        "+":"+",
        "-":"-",
        "=":"=",
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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
        "(": "₍",
        ")": "₎",
        "{": "{",
        "}": "}",
        "[": "[",
        "]": "]",
        
        "a": "ₐ",
        "e": "ₑ",
        "i": "ᵢ",
        "k": "ₖ",
        "l": "ₗ",
        "m": "ₘ",
        "n": "ₙ",
        "o": "ₒ",
        "r": "ᵣ",
        "s": "ₛ",
        "t": "ₜ",
        "u": "ᵤ",
        "v": "ᵥ",
        "x": "ₓ",
        "y": "ᵧ"
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
        "(": "₍",
        ")": "₎",
        "{": "{",
        "}": "}",
        "[": "[",
        "]": "]"
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
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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
        "=": "=",
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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
        
        "+":"+",
        "-":"-",
        "=":"=",
        "(":"(",
        ")":")",
        "{":"{",
        "}":"}",
        "[":"[",
        "]":"]",
        
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

    
    func alphabetToGreek(alphabet : String) -> String {
        switch alphabet {
        case "1":
            return "Ⅰ"
        case "2":
            return "Ⅱ"
        case "3":
            return "Ⅲ"
        case "4":
            return "Ⅳ"
        case "5":
            return "Ⅴ"
        case "6":
            return "Ⅵ"
        case "7":
            return "Ⅶ"
        case "8":
            return "Ⅷ"
        case "9":
            return "Ⅸ"
        case "0":
            return "Ⅹ"
            
        case "a":
            return "α"
        case "b":
            return "β"
        case "d":
            return "δ"
        case "e":
            return "ε"
        case "f":
            return "φ"
        case "g":
            return "γ"
        case "h":
            return "η"
        case "i":
            return "ι"
        case "j":
            return "ϑ"
        case "k":
            return "κ"
        case "l":
            return "λ"
        case "m":
            return "μ"
        case "n":
            return "ν"
        case "o":
            return "ο"
        case "p":
            return "π"
        case "q":
            return "θ"
        case "r":
            return "ρ"
        case "s":
            return "σ"
        case "t":
            return "τ"
        case "u":
            return "υ"
        case "v":
            return "ϖ"
        case "w":
            return "ω"
        case "x":
            return "χ"
        case "y":
            return "ψ"
        case "z":
            return "ζ"
        default:
            return "x"
        }
    }
    
    func buttonAction() {
        if KeyboardNumber == 0 || KeyboardNumber == 3 {
            key0 = "0"
            key1 = "1"
            key2 = "2"
            key3 = "3"
            key4 = "4"
            key5 = "5"
            key6 = "6"
            key7 = "7"
            key8 = "8"
            key9 = "9"
            
            keyPlas = "+"
            keyMinus = "-"
            keyEqual = "="
            keyBracketsS = "("
            keyBracketsE = ")"
            keyBracketsMidS = "{"
            keyBracketsMidE = "}"
            keyBracketsBigS = "["
            keyBracketsBigE = "]"
            
            keyA = "a"
            keyB = "b"
            keyC = "c"
            keyD = "d"
            keyE = "e"
            keyF = "f"
            keyG = "g"
            keyH = "h"
            keyI = "i"
            keyJ = "j"
            keyK = "k"
            keyL = "l"
            keyM = "m"
            keyN = "n"
            keyO = "o"
            keyP = "p"
            keyQ = "q"
            keyR = "r"
            keyS = "s"
            keyT = "t"
            keyU = "u"
            keyV = "v"
            keyW = "w"
            keyX = "x"
            keyY = "y"
            keyZ = "z"
        } else if KeyboardNumber == 1 || KeyboardNumber == 4 {
            key0 = "₀"
            key1 = "₁"
            key2 = "₂"
            key3 = "₃"
            key4 = "₄"
            key5 = "₅"
            key6 = "₆"
            key7 = "₇"
            key8 = "₈"
            key9 = "₉"
            
            keyPlas = "₊"
            keyMinus = "₋"
            keyEqual = "₌"
            keyBracketsS = "₍"
            keyBracketsE = "₎"
            
            keyA = "ₐ"
            keyB = ""
            keyC = ""
            keyD = ""
            keyE = "ₑ"
            keyF = ""
            keyG = ""
            keyH = "ₕ"
            keyI = "ᵢ"
            keyJ = "ⱼ"
            keyK = "ₖ"
            keyL = "ₗ"
            keyM = "ₘ"
            keyN = "ₙ"
            keyO = "ₒ"
            keyP = "ₚ"
            keyQ = ""
            keyR = "ᵣ"
            keyS = "ₛ"
            keyT = "ₜ"
            keyU = "ᵤ"
            keyV = "ᵥ"
            keyW = ""
            keyX = "ₓ"
            keyY = ""
            keyZ = ""
        } else if KeyboardNumber == 2 {
            key0 = "⁰"
            key1 = "¹"
            key2 = "²"
            key3 = "³"
            key4 = "⁴"
            key5 = "⁵"
            key6 = "⁶"
            key7 = "⁷"
            key8 = "⁸"
            key9 = "⁹"
            
            keyPlas = "⁺"
            keyMinus = "⁻"
            keyEqual = "⁼"
            keyBracketsS = "⁽"
            keyBracketsE = "⁾"
            
            keyA = "ᵃ"
            keyB = "ᵇ"
            keyC = "ᶜ"
            keyD = "ᵈ"
            keyE = "ᵉ"
            keyF = "ᶠ"
            keyG = "ᵍ"
            keyH = "ʰ"
            keyI = "ᶦ"
            keyJ = "ʲ"
            keyK = "ᵏ"
            keyL = "ˡ"
            keyM = "ᵐ"
            keyN = "ⁿ"
            keyO = "ᵒ"
            keyP = "ᵖ"
            keyQ = "ᑫ"
            keyR = "ʳ"
            keyS = "ˢ"
            keyT = "ᵗ"
            keyU = "ᵘ"
            keyV = "ᵛ"
            keyW = "ʷ"
            keyX = "ˣ"
            keyY = "ʸ"
            keyZ = "ᶻ"
        }
    }
        
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(needsInputModeSwitchKey: true, nextKeyboardAction: Selector(("dummy"))) { _ in } deleteTextAction: {} moveRightAction: {} moveLeftAction: {}
    }
    
}


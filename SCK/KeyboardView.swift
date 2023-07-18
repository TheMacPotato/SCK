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
    @State var KeyboardNumber: Int = 0
    // 0 = default, 1 = subScript, 2 = superScript, 3 = greek, 4 = science
    
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
                    
                    if KeyboardNumber != 4{
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
                    if KeyboardNumber != 4 {
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyQ))
                        } label: {
                            keyLineDisplay(keyString: "q")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyW))
                        } label: {
                            keyLineDisplay(keyString: "w")
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
                            keyLineDisplay(keyString: "y")
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
                    if KeyboardNumber != 4 {
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
                            keyLineDisplay(keyString: "d")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyF))
                        } label: {
                            keyLineDisplay(keyString: "f")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyG))
                        } label: {
                            keyLineDisplay(keyString: "g")
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
                        
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    if KeyboardNumber != 4 {
                        
                        Button {
                            shiftSwitch = 1
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
                            keyLineDisplay(keyString: "z")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyX))
                        } label: {
                            keyDisplay(keyString: "x")
                        }
                        Button {
                            inputTextAction(keyC)
                        } label: {
                            keyLineDisplay(keyString: "c")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyV))
                        } label: {
                            keyDisplay(keyString: "v")
                        }
                        Button {
                            inputTextAction(inputTextChange(alphabet: keyB))
                        } label: {
                            keyLineDisplay(keyString: "b")
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
                        Button {
                            shiftSwitch = 2
                        } label: {
                            if shiftSwitch == 2 {
                                Image(systemName: "capslock")
                                    .frame(width: 44, height: 40)
                                    .foregroundColor(Color.white)
                                    .background(Color.gray)
                            } else {
                                Image(systemName: "capslock")
                                    .frame(width: 44, height: 40)
                            }
                        }
                    } else if KeyboardNumber == 4 {
                        
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
                    .frame(width: 44, height: 40)
                }
                
                Button(){
                    KeyboardNumber = 0
                    buttonAction()
                } label: {
                    if KeyboardNumber == 0 {
                        Image(systemName: "character")
                            .frame(width: 35, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "character")
                            .frame(width: 35, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                Button(){
                    KeyboardNumber = 1
                    buttonAction()
                } label: {
                    if KeyboardNumber == 1 {
                        Image(systemName: "textformat.subscript")
                            .frame(width: 35, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "textformat.subscript")
                            .frame(width: 35, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                Button(){
                    KeyboardNumber = 2
                    buttonAction()
                } label: {
                    if KeyboardNumber == 2 {
                        Image(systemName: "textformat.superscript")
                            .frame(width: 35, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "textformat.superscript")
                            .frame(width: 35, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }
                
                
                Button(){
                    KeyboardNumber = 3
                    buttonAction()
                } label: {
                    if KeyboardNumber == 3 {
                        Image(systemName: "function")
                            .frame(width: 35, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "function")
                            .frame(width: 35, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    }
                }

                Button(){
                    KeyboardNumber = 4
                    buttonAction()
                } label: {
                    if KeyboardNumber == 4 {
                        Image(systemName: "testtube.2")
                            .frame(width: 35, height: 30)
                            .foregroundColor(Color.white)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
                    } else {
                        Image(systemName: "testtube.2")
                            .frame(width: 35, height: 30)
                            .clipShape(RoundedRectangle(cornerRadius: 4))
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
        }
        .foregroundColor(Color(uiColor: .label))
        .frame(height: 300)
    }
    
    func keyLineDisplay(keyString : String) -> some View {
        if KeyboardNumber == 1 {
            return Text(keyString)
                .strikethrough()
                .frame(width: 30, height: 40)
        } else if KeyboardNumber == 3 {
            return Text(alphabetToGreek(alphabet:keyString))
                .frame(width: 30, height: 40)
        } else {
            return Text(keyString)
                .frame(width: 30, height: 40)
        }
    }
    
    func keyDisplay(keyString : String) -> some View {
        if KeyboardNumber == 3 {
            return Text(alphabetToGreek(alphabet:keyString))
                .frame(width: 30, height: 40)
        } else {
            return Text(keyString)
                .frame(width: 30, height: 40)
        }
    }
    
    func inputTextChange(alphabet : String) -> String {
        if KeyboardNumber == 3 {
            return alphabetToGreek(alphabet: alphabet)
        } else {
            return alphabet
        }
    }
    
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
        KeyboardView(needsInputModeSwitchKey: true, nextKeyboardAction: Selector(("dummy"))) { _ in } deleteTextAction: {}
    }
    
}


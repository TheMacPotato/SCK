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
    
    @State var key0 = "₀"
    @State var key1 = "₁"
    @State var key2 = "₂"
    @State var key3 = "₃"
    @State var key4 = "₄"
    @State var key5 = "₅"
    @State var key6 = "₆"
    @State var key7 = "₇"
    @State var key8 = "₈"
    @State var key9 = "₉"
    
    @State var keyA = "ₐ"
    @State var keyB = "ᵇ"
    @State var keyC = "ᶜ"
    @State var keyD = "ᵈ"
    @State var keyE = "ᵉ"
    @State var keyF = "ᶠ"
    @State var keyG = "ᵍ"
    @State var keyH = "ʰ"
    @State var keyI = "ᶦ"
    @State var keyJ = "ʲ"
    @State var keyK = "ᵏ"
    @State var keyL = "ˡ"
    @State var keyM = "ᵐ"
    @State var keyN = "ⁿ"
    @State var keyO = "ᵒ"
    @State var keyP = "ᵖ"
    @State var keyQ = "ᑫ"
    @State var keyR = "ʳ"
    @State var keyS = "ˢ"
    @State var keyT = "ᵗ"
    @State var keyU = "ᵘ"
    @State var keyV = "ᵛ"
    @State var keyW = "ʷ"
    @State var keyX = "ˣ"
    @State var keyY = "ʸ"
    @State var keyZ = "ᶻ"
     
    
    @State var keyPlas = "₊"
    @State var keyMinus = "₋"
    @State var keyEqual = "₌"
    @State var keyBracketsS = "₍"
    @State var keyBracketsE = "₎"
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Group {
                    
                    // Input Text
                    if KeyboardNumber == 0 || KeyboardNumber == 1{
                        Button {
                            inputTextAction(key1)
                        } label: {
                            Text("1")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key2)
                        } label: {
                            Text("2")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key3)
                        } label: {
                            Text("3")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key4)
                        } label: {
                            Text("4")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key5)
                        } label: {
                            Text("5")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key6)
                        } label: {
                            Text("6")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key7)
                        } label: {
                            Text("7")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key8)
                        } label: {
                            Text("8")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key9)
                        } label: {
                            Text("9")
                                .frame(width: 30, height: 44)
                        }
                        
                        Button {
                            inputTextAction(key0)
                        } label: {
                            Text("0")
                                .frame(width: 30, height: 44)
                        }
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            HStack{
                Group {
                    Button {
                        inputTextAction(keyQ)
                    } label: {
                        Text("q")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyW)
                    } label: {
                        Text("w")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyE)
                    } label: {
                        Text("e")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyR)
                    } label: {
                        Text("r")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyT)
                    } label: {
                        Text("t")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyY)
                    } label: {
                        Text("y")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyU)
                    } label: {
                        Text("u")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyI)
                    } label: {
                        Text("i")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyO)
                    } label: {
                        Text("o")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyP)
                    } label: {
                        Text("p")
                            .frame(width: 30, height: 44)
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        inputTextAction(keyA)
                    } label: {
                        Text("a")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyS)
                    } label: {
                        Text("s")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyD)
                    } label: {
                        Text("d")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyF)
                    } label: {
                        Text("f")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyG)
                    } label: {
                        Text("g")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyH)
                    } label: {
                        Text("h")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyJ)
                    } label: {
                        Text("j")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyK)
                    } label: {
                        Text("k")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyL)
                    } label: {
                        Text("l")
                            .frame(width: 30, height: 44)
                    }
                }
                .background(Color(uiColor: .systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            
            HStack{
                Group {
                    Button {
                        inputTextAction(keyA)
                    } label: {
                        Text("a")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyS)
                    } label: {
                        Text("s")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyD)
                    } label: {
                        Text("d")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyF)
                    } label: {
                        Text("f")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyG)
                    } label: {
                        Text("g")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyH)
                    } label: {
                        Text("h")
                            .frame(width: 30, height: 44)
                    }
                    Button {
                        inputTextAction(keyJ)
                    } label: {
                        Text("j")
                            .frame(width: 30, height: 44)
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
                            .frame(width: 30, height: 44)
                    }
                    
                    Button {
                        inputTextAction(keyMinus)
                    } label: {
                        Text("-")
                            .frame(width: 30, height: 44)
                    }
                    
                    Button {
                        inputTextAction(keyEqual)
                    } label: {
                        Text("=")
                            .frame(width: 30, height: 44)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsS)
                    } label: {
                        Text("(")
                            .frame(width: 30, height: 44)
                    }
                    
                    Button {
                        inputTextAction(keyBracketsE)
                    } label: {
                        Text(")")
                            .frame(width: 30, height: 44)
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
                    .frame(width: 44, height: 44)
                }
                Button(){
                    KeyboardNumber = 0
                    buttonAction()
                } label: {
                    if KeyboardNumber == 0 {
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
                    KeyboardNumber = 1
                    buttonAction()
                } label: {
                    if KeyboardNumber == 1 {
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
                    KeyboardNumber = 2
                    buttonAction()
                } label: {
                    if KeyboardNumber == 2 {
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

                
                // Delete Text
                Button {
                    deleteTextAction()
                } label: {
                    Image(systemName: "delete.left")
                        .frame(width: 44, height: 44)
                }
            }
        }
        .foregroundColor(Color(uiColor: .label))
        .frame(height: 160)
    }
    func buttonAction() {
        if KeyboardNumber == 0 {
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
        } else if KeyboardNumber == 1 {
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
        } else if KeyboardNumber == 2 {
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
        }
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardView(needsInputModeSwitchKey: true, nextKeyboardAction: Selector(("dummy"))) { _ in } deleteTextAction: {}
    }
    
}


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


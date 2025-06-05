//
//  KeyboardViewController.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

//
//  KeyboardViewController.swift
//  HelloWorldKeyboard
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController{
    @State static var count = 0
    
        
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
            
        
        let nextKeyboardAction = #selector(self.handleInputModeList(from:with:))
        // カスタムUIのセットアップをここで行う
        let keyboardView = KeyboardView(needsInputModeSwitchKey: needsInputModeSwitchKey, nextKeyboardAction: nextKeyboardAction,
                                        inputTextAction: { [weak self] text in
            guard let self else { return }
            self.textDocumentProxy.insertText(text)
            
        }, deleteTextAction: { [weak self] in
            guard let self,
                  self.textDocumentProxy.hasText else { return }
            
            self.textDocumentProxy.deleteBackward()
        }, moveRightAction: { [weak self] in
            guard let self = self else { return }

            if let after = self.textDocumentProxy.documentContextAfterInput {
                if after.isEmpty {
                    // カーソルが文書の末尾にある場合
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
                } else {
                    let offset = after.prefix(1).utf16.count
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
                }
            } else {
                // カーソルが文書の末尾にある場合
                self.textDocumentProxy.adjustTextPosition(byCharacterOffset: 1)
            }
        }, moveLeftAction: { [weak self] in
            guard let self = self else { return }

            if let before = self.textDocumentProxy.documentContextBeforeInput {
                let offset = before.prefix(1).utf16.count * -1
                self.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
            } else {
                // カーソルが文書の先頭にある場合
                self.textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
            }
        })

        
        
        // keyboardViewのSuperViewのSuperView(UIHostingController)の背景を透明にする
        let hostingController = UIHostingController(rootView: keyboardView.BackgroundColor(.clear))
        
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

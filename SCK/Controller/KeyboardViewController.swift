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


// MARK: - カスタムキーボードのメインコントローラー
// `UIInputViewController` を継承して、システムキーボードの代わりとなるViewを提供する
class KeyboardViewController: UIInputViewController{
    // MARK: - 初期処理
    override func viewDidLoad() {
        setup()
    }
    
    // MARK: - キーボードUIのセットアップ
    private func setup() {
        // 次のキーボードへ切り替えるためのアクション（地球儀キー）
        let nextKeyboardAction = #selector(self.handleInputModeList(from:with:))
        // SwiftUIのキーボードViewを作成し、各種アクションをクロージャで渡す
        let keyboardView = KeyboardView(
            needsInputModeSwitchKey: needsInputModeSwitchKey, nextKeyboardAction: nextKeyboardAction,
            // テキスト入力処理：渡された文字列を現在のカーソル位置に挿入
            inputTextAction: { [weak self] text in
                guard let self else { return }
                KeyboardInputController.insertText(text, proxy: self.textDocumentProxy)
            },
            // テキスト削除処理：1文字削除（文字が存在する場合のみ）
            deleteTextAction: { [weak self] in
                guard let self else { return }
                KeyboardInputController.deleteText(proxy: self.textDocumentProxy)
            },
            // カーソルを右に移動（次の文字のUTF16長に基づいて移動）
            moveRightAction: { [weak self] in
                guard let self = self else { return }
                KeyboardInputController.moveCursorRight(proxy: self.textDocumentProxy)
            },
            // カーソルを左に移動（前の文字のUTF16長に基づいて戻す）
            moveLeftAction: { [weak self] in
                guard let self = self else { return }
                
                if let before = self.textDocumentProxy.documentContextBeforeInput,
                   !before.isEmpty {
                    let offset = -before.suffix(1).utf16.count
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: offset)
                } else {
                    // 文頭のさらに外：1文字分戻す
                    self.textDocumentProxy.adjustTextPosition(byCharacterOffset: -1)
                }
            }
        )
        
        // MARK: - SwiftUIのViewをUIKitのキーボードに組み込む

        // KeyboardView を UIHostingController でラップし、背景を透明に設定
        let hostingController = UIHostingController(rootView: keyboardView.BackgroundColor(.clear))
        
        // ViewController に HostingController を追加し、ビュー階層に組み込む
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        // Auto Layout制約でHostingControllerのViewを画面全体にフィットさせる
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

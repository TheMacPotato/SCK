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
    private let shift = ShiftState()
    private let keyboardMode = KeyboardMode()
    private lazy var keyboardContext = KeyboardActionContext(shift: shift, keyboardMode: keyboardMode)
        
    
    // MARK: - 初期処理
    override func viewDidLoad() {
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        keyboardContext.inputProxy = self.textDocumentProxy
    }
    
    // MARK: - キーボードUIのセットアップ
    private func setup() {
        // キーボードビューの生成と埋め込み処理を分離して可読性向上
        let keyboardView = createKeyboardView()
        embedKeyboardView(keyboardView)
    }
    
    /// SwiftUIベースのキーボードビューを生成する
    private func createKeyboardView() -> some View {
        let nextKeyboardAction = #selector(self.handleInputModeList(from:with:))

        return KeyboardView(
            needsInputModeSwitchKey: needsInputModeSwitchKey,
            nextKeyboardAction: nextKeyboardAction
        )
        .environmentObject(shift)
        .environmentObject(keyboardMode)
        .environmentObject(keyboardContext)
        .BackgroundColor(.clear)
    }
    
    /// SwiftUIキーボードビューをUIKitのビュー階層に組み込む
    private func embedKeyboardView<V: View>(_ view: V) {
        let hostingController = UIHostingController(rootView: view)
        
        // HostingController を子ViewControllerとして追加
        self.addChild(hostingController)
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        // Auto Layout 制約でフルスクリーンにフィット
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            hostingController.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostingController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

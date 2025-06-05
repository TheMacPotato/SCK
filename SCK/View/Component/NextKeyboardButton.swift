//
//  NextKeyboardButton.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import SwiftUI

// MARK: - 次のキーボードに切り替えるためのカスタムボタン
/// `systemName` に指定したSF Symbolを表示し、その上にタップ領域として `UIButton` を透明で重ねて動作させる
/// iOSのカスタムキーボードでは、次のキーボードに切り替える処理は `UIButton` に限定されているため、このような構成が必要
struct NextKeyboardButton: View {
    let systemName: String          // 表示するアイコン（SF Symbolsの名前）
    let action: Selector            // 実行するセレクタ（例: handleInputModeList）
    
    var body: some View {
        Image(systemName: systemName)   // SF Symbolを表示（例: "globe"）
            .overlay {
                // UIViewRepresentable を使って UIButton を SwiftUI 上に重ねる
                NextKeyboardButtonOverlay(action: action)
            }
    }
}
     
// MARK: - SwiftUI上にUIButtonを重ねるためのラッパー
/// iOSの制約により、次のキーボード切り替えには明示的な `UIButton` が必要
struct NextKeyboardButtonOverlay: UIViewRepresentable {
    let action: Selector
    
    // SwiftUIビューの裏側に配置するUIKitのUIButtonを生成
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        
        // UIInputViewController に送るため、ターゲットはnil（適切な responder にルーティング）
        button.addTarget(nil,
                         action: action,
                         for: .allTouchEvents)
        return button
    }
    
    // 更新は不要なので空実装
    func updateUIView(_ button: UIButton, context: Context) {}
}

// MARK: - プレビュー（XcodeのCanvas用）
struct NextKeyboardButton_Previews: PreviewProvider {
    static var previews: some View {
        NextKeyboardButton(systemName: "globe",
                           action: Selector(("dummy")))
    }
}

//
//  DeleteButton.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// MARK: - 入力された文字を1文字削除するカスタムボタン
/// 通常のキーボードにおける「⌫ バックスペース」に相当
public struct DeleteButton: View {
    /// 削除アクション（親Viewからクロージャで渡す）
    /// 例：`textDocumentProxy.deleteBackward()` などを呼び出す想定
    public let deleteAction: () -> Void
    
    /// 現在のカラースキーム（ライトモード / ダークモード）を取得
    @Environment(\.colorScheme) private var colorScheme
    
    /// イニシャライザで削除アクションを受け取る
    public init(deleteAction: @escaping () -> Void) {
        self.deleteAction = deleteAction
    }
    
    /// ボディ（UI構成）：削除ボタンを構築
    public var body: some View {
        Button(action: deleteAction) {
            Image(systemName: "delete.left")    // SF Symbol: ⌫
                .frame(width: 44, height: 40)   // ボタンサイズ
                .foregroundColor(colorScheme == .dark ? .white : .black)    // アイコンの色
                .background(colorScheme == .dark ? Color.black : Color.white)   // 背景色
                .clipShape(RoundedRectangle(cornerRadius: 8))   // 角丸ボタン
        }
    }
}

/// MARK: - プレビュー（開発用デバッグ表示）
/// `deleteAction` に print を渡して確認可能
#Preview {
    DeleteButton(deleteAction: { print("delete") })
        .padding()
}

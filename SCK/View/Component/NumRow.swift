//
//  NumRow.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

// MARK: - 数字キーを一列に並べたビュー
/// 「1〜0」までの数字キーを表示し、各キーが押されたときに `keyAction` が呼び出される
struct NumRow: View {

    var body: some View {
        // 数字キーを横一列に表示
        // KeyRow は共通コンポーネントで、同じ処理を各キーに適用できる
        KeyRow(
            keys: ["1","2","3","4","5","6","7","8","9","0"],
        )
    }
}

// MARK: - プレビュー（Xcode Canvas用）
/// 各キーが押されたときの挙動を `print` で確認できる
#Preview {
    NumRow()
}

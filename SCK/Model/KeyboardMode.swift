//
//  KeyboardMode.swift
//  SCK
//
//  Created by Yoshiki on 2025/06/05.
//

import Foundation

// MARK: - キーボードの表示モードを定義する列挙型
// Viewでのモード切り替えに使われ、各モードに応じて異なるレイアウトを表示する
enum KeyboardMode: Int {
    case `default` = 0        // 通常の文字入力モード（アルファベットなど）
    case subscriptMode = 1    // 添え字入力モード（化学式や数式などで使用）
    case superscript = 2      // 上付き文字入力モード（指数表記などで使用）
    case greek = 3            // ギリシャ文字入力モード（理系記号や数式に便利）
    case math = 4             // 数学記号入力モード（積分記号、演算子など）
}

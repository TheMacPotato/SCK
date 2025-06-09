//
//  View+BackgroundColor.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import UIKit
import SwiftUI

/// SwiftUIのViewに対して、UIKitベースの背景色を適用するカスタム拡張
extension View {
    
    /// UIKitのUIColorを使って背景色を設定するカスタムView修飾子
    func BackgroundColor(_ color: UIColor) -> some View {
        background(BackgroundColorView(color: color))
    }
}

/// SwiftUIでUIViewを使用して背景色を設定するためのUIViewRepresentable構造体
struct BackgroundColorView: UIViewRepresentable {
    
    /// 設定したい背景色（UIKitのUIColor）
    let color: UIColor
    
    /// UIViewを生成し、非同期でそのスーパービューの背景色を設定
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        Task {
            // SwiftUIのView階層はラップされているため、2階層上のスーパービューに背景色を設定
            view.superview?.superview?.backgroundColor = color
        }
        return view
    }
    
    /// Viewの更新処理（今回は特に必要ないため空実装）
    func updateUIView(_ uiView: UIView, context: Context) {}
}

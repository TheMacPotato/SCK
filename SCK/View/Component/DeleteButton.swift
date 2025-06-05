//
//  DeleteButton.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

/// 入力文字を 1 文字削除するボタン
public struct DeleteButton: View {
    /// 削除アクション（1 文字削除）
    public let deleteAction: () -> Void
    @Environment(\.colorScheme) private var colorScheme
    
    public init(deleteAction: @escaping () -> Void) {
        self.deleteAction = deleteAction
    }
    
    public var body: some View {
        Button(action: deleteAction) {
            Image(systemName: "delete.left")
                .frame(width: 44, height: 40)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                .background(colorScheme == .dark ? Color.black : Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    DeleteButton(deleteAction: { print("delete") })
        .padding()
}

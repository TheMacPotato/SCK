//
//  NumRow.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

struct NumRow: View {
    let keyAction: (String) -> Void
    
    var body: some View {
        // ① 数字行（変更なし）
        KeyRow(keys: ["1","2","3","4","5","6","7","8","9","0"],
               action: keyAction)
    }
}

#Preview {
    NumRow(keyAction: { print("Key action:", $0) })
}

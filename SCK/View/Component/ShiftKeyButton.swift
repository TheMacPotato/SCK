//
//  ShiftKeyButton.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

struct ShiftKeyButton: View {
    @EnvironmentObject var shift: ShiftState
    var body: some View {
        Button { shift.toggle() } label: {
            Image(systemName: "shift")
                .frame(width: 44, height: 40)
                .foregroundColor(shift.state == .on ? .white : .black)
                .background(shift.state == .on ? .gray : .clear)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

#Preview {
    ShiftKeyButton()
        .environmentObject(ShiftState())
}

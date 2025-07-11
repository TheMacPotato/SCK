//
//  DeleteButton.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

public struct DeleteButton: View {
    @EnvironmentObject var actionContext: KeyboardActionContext
    @State private var deleteTimer: Timer?
    @State private var isPressing = false

    public var body: some View {
        Button(action: {
            actionContext.delete()
        }) {
            Image(systemName: "delete.left")
                .frame(width: 44, height: 40)
                .foregroundColor(.white)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if !isPressing {
                        isPressing = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            if isPressing {
                                deleteTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                                    Task { @MainActor in
                                        actionContext.delete()
                                    }
                                }
                            }
                        }
                    }
                }
                .onEnded { _ in
                    isPressing = false
                    deleteTimer?.invalidate()
                    deleteTimer = nil
                }
        )
        .onDisappear {
            deleteTimer?.invalidate()
            deleteTimer = nil
            isPressing = false
        }
    }
}

#Preview {
    DeleteButton()
        .padding()
        .environmentObject(KeyboardActionContext(shift: ShiftState(), keyboardMode: KeyboardMode()))
}

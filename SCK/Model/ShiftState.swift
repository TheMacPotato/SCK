//
//  ShiftState.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2025/06/05.
//

import SwiftUI

final class ShiftState: ObservableObject {
    enum State { case off, on }
    @Published var state: State = .off
    func toggle() { state = (state == .off ? .on : .off) }
}

//
//  View+BackgroundColor.swift
//  SCK
//
//  Created by Yoshiki on 2023/07/07.
//

import UIKit
import SwiftUI

extension View {
    
    func BackgroundColor(_ color: UIColor) -> some View {
        background(BackgroundColorView(color: color))
    }
}

struct BackgroundColorView: UIViewRepresentable {
    
    let color: UIColor
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        Task {
            view.superview?.superview?.backgroundColor = color
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

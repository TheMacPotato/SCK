////
////  BracketAction.swift
////  ScienceCustomKeyboard
////
////  Created by Yoshiki on 2025/06/06.
////
//
//import Foundation
//
//// MARK: - 括弧などの入力後にカーソルを戻す処理
//func bracketAction(key : String){
//    switch keyboardMode {
//    case .default:
//        if shift.state == .off, let char = defaultKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        } else if let char = defaultShiftKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        }
//    case .subscriptMode:
//        if shift.state == .off, let char = subScriptKeys[key] {
////            inputTextAction(char)
//            moveLeftAction()
//        } else if let char = subScriptShiftKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        }
//    case .superscript:
//        if shift.state == .off, let char = superScriptKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        } else if let char = superScriptShiftKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        }
//    case .greek:
//        if shift.state == .off, let char = greekKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        } else if let char = greekShiftKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        }
//    case .math:
//        if shift.state == .off, let char = defaultKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        } else if let char = defaultShiftKeys[key] {
//            inputTextAction(char)
//            moveLeftAction()
//        }
//    }
//}

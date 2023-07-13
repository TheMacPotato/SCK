//
//  ScienceCustomKeyboardApp.swift
//  ScienceCustomKeyboard
//
//  Created by Yoshiki on 2023/06/20.
//

import SwiftUI
@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    @MainActor class UIInputViewController : UIViewController{
        struct ScienceCustomKeyboardApp: App {
            var body: some Scene {
                WindowGroup {
                    ContentView()
                }
            }
        }
    }
}

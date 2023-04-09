//
//  appdev7App.swift
//  appdev7
//
//  Created by SKUBI on 21/03/23.
//

import SwiftUI
import Firebase

@main
struct appdev7App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    class AppDelegate: UIResponder, UIApplicationDelegate {
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            return true
        }
    }
}

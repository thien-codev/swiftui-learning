//
//  SwiftUIThienCodevApp.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 13/10/2023.
//

import SwiftUI

@main
struct SwiftUIThienCodevApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ParalaxScrollView()
        }
        
        .onChange(of: scenePhase) { newValue in
            switch newValue {
            case .background:
                var shortcut = UIApplication.shared.shortcutItems ?? []
                for action in data {
                    shortcut.append(action.quickAction())
                }
                
                UIApplication.shared.shortcutItems = shortcut
            case .active:
                print("App is active")
            case .inactive:
                print("App is inactive")
            @unknown default:
                break
            }
        }
    }
}

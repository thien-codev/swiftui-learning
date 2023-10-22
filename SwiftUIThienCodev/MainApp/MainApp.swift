//
//  SwiftUIThienCodevApp.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 13/10/2023.
//

import SwiftUI

@main
struct SwiftUIThienCodevApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    init() {
        Settings.inject(style: .colorful)
    }
    
    var body: some Scene {
        WindowGroup {
            BasicAnimationView()
        }.onChange(of: scenePhase) { oldValue, newValue in
            switch newValue {
            case .background:
                print("App ---> Background")
            case .active:
                print("App ---> Active")
            case .inactive:
                print("App ---> Inactive")
            default: break
            }
        }
    }
}

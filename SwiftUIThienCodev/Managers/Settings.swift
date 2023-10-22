//
//  Settings.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 14/10/2023.
//

import Foundation
import SwiftUI

enum Style {
    case light
    case dark
    case colorful
    
    var backgroudColor: Color {
        switch self {
        case .light:
            return .white
        case .dark:
            return .black
        case .colorful:
            return .green
        }
    }
}

class Settings: ObservableObject {
    private var style: Style
    
    static var manager = Settings()
    
    init() {
        style = .light
    }
    
    static func inject(style: Style) {
        manager.style = style
    }
}

extension Settings {
    var themeColor: Color {
        style.backgroudColor
    }
}

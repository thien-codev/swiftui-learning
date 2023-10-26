//
//  Logic.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 25/10/2023.
//

import Foundation
import SwiftUI

struct QuickAction: Hashable {
    var type: String
    var title: String
    var subtitle: String
    var icon: String
    
    func quickAction() -> UIApplicationShortcutItem {
        return UIApplicationShortcutItem(type: type,
                                         localizedTitle: title,
                                         localizedSubtitle: subtitle,
                                         icon: .init(systemImageName: icon))
    }
}

enum ActionType: CaseIterable {
    case first
    case second
    case third
    case forth
    case fifth
    
    var value: QuickAction {
        switch self {
        case .first:
            return QuickAction(type: "First", title: "First title", subtitle: "First subtitle", icon: "heart.fill")
        case .second:
            return QuickAction(type: "Second", title: "Second title", subtitle: "Second subtitle", icon: "person.fill")
        case .third:
            return QuickAction(type: "Third", title: "Third title", subtitle: "Third subtitle", icon: "doc.fill")
        case .forth:
            return QuickAction(type: "Forth", title: "Forth title", subtitle: "Forth subtitle", icon: "folder")
        case .fifth:
            return QuickAction(type: "Fifth", title: "Fifth title", subtitle: "Fifth subtitle", icon: "scribble")
        }
    }
}

let data: [QuickAction] = ActionType.allCases.map({ $0.value })

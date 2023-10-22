//
//  UserViewSwiftUI.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 16/10/2023.
//

import Foundation
import SwiftUI

struct UserViewSwiftUI: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UserView {
        return UserView()
    }
    
    func updateUIView(_ uiView: UserView, context: Context) { }
}

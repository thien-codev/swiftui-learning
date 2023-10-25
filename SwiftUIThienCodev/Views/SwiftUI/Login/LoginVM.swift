//
//  LoginVM.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 20/10/2023.
//

import Foundation
import SwiftUI

class LoginVM: ObservableObject {
    
    enum LoginState {
        case ready
        case success
        case failure
    }
    
    func login(with username: String, password: String) -> LoginState {
        if username.lowercased() == "tnu", password.lowercased() == "ndthien01" {
            return .success
        } else {
            return .failure
        }
    }
}

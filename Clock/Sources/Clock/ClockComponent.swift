//
//  ClockComponent.swift
//  
//
//  Created by ndthien01 on 19/10/2023.
//

import Foundation

extension Int {
    var toTimeComponent: String {
        return String(format: "%02d", self)
    }
}

struct ClockComponent {    
    private var calendar = Calendar.current
    
    var hour: String
    var minute: String
    var second: String
    
    init() {
        let now = Date()
        hour = calendar.component(.hour, from: now).toTimeComponent
        minute = calendar.component(.minute, from: now).toTimeComponent
        second = calendar.component(.second, from: now).toTimeComponent
    }
    
    mutating func process(with date: Date = Date()) {
        hour = calendar.component(.hour, from: date).toTimeComponent
        minute = calendar.component(.minute, from: date).toTimeComponent
        second = calendar.component(.second, from: date).toTimeComponent
    }
}

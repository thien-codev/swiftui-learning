//
//  ClockManager.swift
//  
//
//  Created by ndthien01 on 18/10/2023.
//

import Foundation
import SwiftUI

enum ClockState {
    case ready
    case running
    case finish
    
    var tintColor: Color {
//        switch self {
//        case .ready, .finish:
//            return Color(UIColor.systemTeal)
//        case .running:
            return "#39ff14".toColor
//        }
    }
}

public class ClockManager: ObservableObject {
    
    public static var manager = ClockManager()
    
    @Published var state: ClockState = .ready
    @Published var clockComponent = ClockComponent()
    
    private var timer: Timer?
    
    public func view(width: CGFloat = 120, height: CGFloat = 80, clockOffset: Binding<CGPoint>) -> some View {
        return ClockView(width: width, height: height, clockOffset: clockOffset)
    }
    
    func updateToNextState() {
        switch state {
        case .ready:
            startClock()
            state = .running
        case .running:
            stopClock()
            state = .finish
        case .finish:
            state = .ready
        }
    }
    
    func startClock() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.clockComponent.process()
        }
        
        timer?.fire()
    }
    
    func stopClock() {
        timer?.invalidate()
    }
}

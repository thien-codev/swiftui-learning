//
//  ClockView.swift
//  
//
//  Created by ndthien01 on 18/10/2023.
//

import Foundation
import SwiftUI
import UIKit

struct ClockView: View {
    
    init(width: CGFloat = 120, height: CGFloat = 80, clockOffset: Binding<CGPoint>) {
        self.width = width
        self.height = height
        self._clockOffset = clockOffset
    }
    
    @ObservedObject var manager = ClockManager.manager
    @State var width: CGFloat
    @State var height: CGFloat
    @State var readyAppear: Bool = false
    @State var runningAppear: Bool = false
    @State var finishAppear: Bool = false
    
    @Binding var clockOffset: CGPoint
    
    var itemHeight: CGFloat {
        height - 30
    }
    var itemWidth: CGFloat {
        (width - 30) / 3
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            
            switch manager.state {
            case .ready:
                Button {
                    withAnimation {
                        readyAppear = false
                    }
                    manager.updateToNextState()
                } label: {
                    Circle()
                        .frame(width: width, height: height)
                        .overlay {
                            Circle()
                                .stroke(manager.state.tintColor, lineWidth: 3)
                        }
                        .foregroundColor(.black)
                        .overlay {
                            Image(systemName: "arrowtriangle.right.fill")
                                .foregroundColor(manager.state.tintColor)
                        }
                }
//                .highPriorityGesture(
//                    DragGesture()
//                        .onChanged { gesture in
//                            clockOffset = gesture.location
//                        }
//                )
                .shadow(color: .black, radius: 0, x: 8, y: 8)
                .scaleEffect(readyAppear ? 1 : 0)
                .onAppear {
                    readyAppear = true
                }
            case .running:
                ZStack {
                    Rectangle()
                        .frame(width: width, height: height)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(manager.state.tintColor, lineWidth: 2)
                        )
                        .shadow(color: .black, radius: 0, x: 8, y: 8)
                    Button {
                        withAnimation {
                            runningAppear = false
                        }
                        manager.updateToNextState()
                    } label: {
                        HStack(spacing: 4) {
                            VStack(spacing: 2) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: itemWidth, height: itemHeight)
                                        .cornerRadius(2)
                                    Text(manager.clockComponent.hour)
                                        .font(Font.system(size: min(itemHeight, itemWidth) - 10))
                                        .fontWeight(.bold)
                                        .foregroundColor(manager.state.tintColor)
                                }
                                Text("Hour")
                                    .font(Font.system(size: 8))
                                    .fontWeight(.bold)
                                    .foregroundColor(manager.state.tintColor)
                            }
                            VStack(spacing: 2) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: itemWidth, height: itemHeight)
                                        .cornerRadius(2)
                                    Text(manager.clockComponent.minute)
                                        .font(Font.system(size: min(itemHeight, itemWidth) - 10))
                                        .fontWeight(.bold)
                                        .foregroundColor(manager.state.tintColor)
                                }
                                Text("Minute")
                                    .font(Font.system(size: 8))
                                    .fontWeight(.bold)
                                    .foregroundColor(manager.state.tintColor)
                            }
                            VStack(spacing: 2) {
                                ZStack {
                                    Rectangle()
                                        .frame(width: itemWidth, height: itemHeight)
                                        .cornerRadius(2)
                                    Text(manager.clockComponent.second)
                                        .font(Font.system(size: min(itemHeight, itemWidth) - 10))
                                        .fontWeight(.bold)
                                        .foregroundColor(manager.state.tintColor)
                                }
                                Text("Second")
                                    .font(Font.system(size: 8))
                                    .fontWeight(.bold)
                                    .foregroundColor(manager.state.tintColor)
                            }
                        }
                        .foregroundColor(.gray.opacity(0.6))
                        .padding(.top, 10)
                    }
                }
                .scaleEffect(runningAppear ? 1 : 0)
                .onAppear {
                    runningAppear = true
                }

            case .finish:
                Button {
                    withAnimation {
                        finishAppear = false
                    }
                    manager.updateToNextState()
                } label: {
                    Circle()
                        .frame(width: width, height: height)
                        .overlay {
                            Circle()
                                .stroke(manager.state.tintColor, lineWidth: 3)
                        }
                        .foregroundColor(.black)
                        .overlay {
                            Image(systemName: "pause.fill")
                                .foregroundColor(manager.state.tintColor)
                        }
                }
                .shadow(color: .black, radius: 0, x: 8, y: 8)
                .onAppear {
                    finishAppear = true
                }
                .scaleEffect(finishAppear ? 1 : 0)
            }
        }
        .animation(.easeInOut(duration: 0.5))
    }
}

struct ClockViewPreview: PreviewProvider {
    static var previews: some View {
        ClockView(clockOffset: .constant(.zero))
    }
}

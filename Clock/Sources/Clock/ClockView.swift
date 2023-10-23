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
    
    init(width: CGFloat = 120, height: CGFloat = 80) {
        self.width = width
        self.height = height
    }
    
    @ObservedObject var manager = ClockManager.manager
    @State var width: CGFloat
    @State var height: CGFloat
    
    var itemHeight: CGFloat {
        height - 30
    }
    var itemWidth: CGFloat {
        (width - 30) / 3
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .frame(width: width, height: height)
                .cornerRadius(10)
            switch manager.state {
            case .ready:
                Button {
                    manager.updateToNextState()
                } label: {
                    Text("Ready")
                        .font(Font.custom("AmericanTypewriter-CondensedBold", size: 28))
                        .foregroundColor(manager.state.tintColor)
                        .multilineTextAlignment(.center)
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: width, height: height)
            case .running:
                Button {
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
            case .finish:
                Button {
                    manager.updateToNextState()
                } label: {
                    Text("Stop")
                        .font(Font.custom("AmericanTypewriter-CondensedBold", size: 28))
                        .foregroundColor(Color(uiColor: UIColor.systemTeal))
                        .multilineTextAlignment(.center)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: width, height: height)
            }
        }
        .shadow(color: .black, radius: 0, x: 8, y: 8)
        .animation(.easeInOut(duration: 0.3))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(manager.state.tintColor, lineWidth: 2)
        )
    }
}

struct ClockViewPreview: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}

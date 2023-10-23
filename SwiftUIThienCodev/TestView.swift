//
//  TestView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 23/10/2023.
//

import SwiftUI

struct DragView: View {
    @State var offset: CGSize
    @State var location: CGPoint
    @State var tapped: Bool = false
       
    var body: some View {
        GeometryReader { geometry in
            Color.teal.ignoresSafeArea()
            VStack(spacing: 4) {
                ForEach(0...50, id: \.self) { indexV in
                    HStack(spacing: 4) {
                        ForEach(0...24, id: \.self) { indexH in
                            let red: Double = Double.random(in: 0...1)
                            let green: Double = Double.random(in: 0...1)
                            let blue: Double = Double.random(in: 0...1)
                            Circle()
                                .foregroundColor(Color(red: 0, green: 0, blue: 0))
                                .shadow(radius: 0, x: 2, y: 2)
                                .scaleEffect(tapped ? 0.5 : 1)
                        }
                    }
                }
            }
//            .overlay(content: {
//                Circle().stroke(lineWidth: 10)
                //                RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 8)
                //                    .shadow(radius: 0, x: 4, y: 4)
//            })
            .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
        }.onTapGesture {
            withAnimation {
                tapped.toggle()
            }
        }
        .animation(.easeInOut, value: location)
    }
}

struct ContentViewa: View {
    var body: some View {
        DragView(offset: .zero, location: .zero)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewa()
    }
}

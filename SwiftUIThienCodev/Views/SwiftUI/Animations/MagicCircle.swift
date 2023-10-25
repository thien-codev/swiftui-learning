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
    @State var randomColor: Color = Color(red: Double.random(in: 0...1),
                                          green: Double.random(in: 0...1),
                                          blue: Double.random(in: 0...1))
    let h = 30
    let v = 22
    let timer = Timer.publish(every: 0.8, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            Color.teal.ignoresSafeArea()
            VStack(spacing: 4) {
                ForEach(1...h, id: \.self) { indexV in
                    HStack(spacing: 4) {
                        ForEach(1...v, id: \.self) { indexH in
                            let delay: Double = Double(indexH) / Double(v) * (Double(indexV) / Double(h))
                            Circle()
                                .foregroundColor(randomColor)
                                .shadow(radius: 0, x: 2, y: 2)
                                .scaleEffect(tapped ? 0 : 1.12, anchor: .center)
                                .animation(.easeInOut(duration: 0.3).delay(delay), value: tapped)
                        }
                    }
                }
            }
            .clipShape(Circle())
            .background(content: {
                Circle()
                    .shadow(radius: 0, x: 10, y: 10)
                    .foregroundColor(Color.teal.opacity(0.8))
            })
            .padding([.leading, .trailing], 40)
            .position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY)
            .onTapGesture {
                withAnimation {
                    tapped.toggle()
                    guard !tapped else { return }
                    randomColor = Color(red: Double.random(in: 0...1),
                                        green: Double.random(in: 0...1),
                                        blue: Double.random(in: 0...1))
                }
            }
            .highPriorityGesture(
                DragGesture()
                    .onChanged { gesture in
                        print(gesture.location)
                    }
            )
            .animation(.easeInOut, value: location)
            .onReceive(timer) { _ in
                withAnimation {
                    tapped.toggle()
                    guard !tapped else { return }
                    randomColor = Color(red: Double.random(in: 0...1),
                                        green: Double.random(in: 0...1),
                                        blue: Double.random(in: 0...1))
                }
            }
        }
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

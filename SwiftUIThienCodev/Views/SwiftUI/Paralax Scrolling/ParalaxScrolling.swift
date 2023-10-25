//
//  ParalaxScrolling.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 25/10/2023.
//

import Foundation
import SwiftUI

struct Model: Identifiable {
    var name: String
    var color: Color
    var price: String
    var description: String
    let id = UUID()
}

struct ParalaxScrollView: View {
    let models = [Model(name: "A", color: .teal, price: "$3", description: "From Korea"),
                  Model(name: "B", color: .brown, price: "$8", description: "From Viet Nam"),
                  Model(name: "C", color: .cyan, price: "$6", description: "From Thailand"),
                  Model(name: "D", color: .indigo, price: "$4", description: "From Laos"),
                  Model(name: "E", color: .green, price: "$43", description: "From Cambodia"),
                  Model(name: "F", color: .purple, price: "$9", description: "From Timor Leste")]
    
    @State var currentIdx: Int = 0
    @State var currentDrag: CGFloat = 0
    
    let padding: CGFloat = 60
    let width: CGFloat = 220
    let textColor: Color = Color(red: 0.262,
                                 green: 0.329,
                                 blue: 0.671)
    
    var body: some View {
        GeometryReader { view in
            Color.gray.opacity(0.4).ignoresSafeArea()
            VStack(alignment: .center, spacing: -80/2) {
                ZStack(alignment: .bottom) {
                    LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 290, height: 450)
                        .cornerRadius(18)
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(.teal)
                        .frame(height: 46)
                        .overlay {
                            Button {
                                print("Home pressed !!")
                            } label: {
                                Image(systemName: "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(.teal)
                            }
                        }
                        .offset(x: 90)
                        .padding(.bottom, 20)
                    
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(.teal)
                        .frame(height: 46)
                        .overlay {
                            Text("$3")
                                .foregroundColor(textColor)
                                .fontWeight(.bold)
                        }
                        .offset(x: -90)
                        .padding(.bottom, 20)
                }
                Circle()
                    .fill(.teal)
                    .frame(height: 66)
                    .overlay {
                        Button {
                            print("Home pressed !!")
                        } label: {
                            Image(systemName: "menucard")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 28)
                                .foregroundColor(Color.white.opacity(0.6))
                        }
                    }
                    .shadow(radius: 4, y: 6)
            }
            .offset(x: UIScreen.screenWidth / 2 - 145)
            .padding(.top, 200)
            
            ZStack {
                ForEach(0..<models.count) { index in
                    ZStack() {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: width, height: width)
                            .foregroundColor(models[index].color)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(.black.opacity( isCurrentIdx(to: index) ? 0 : 0.4))
                            }
                            .shadow(color: models[index].color, radius: 6)
                        
                        Text("Product \(models[index].name)")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(width: width)
                    .offset(x: CGFloat(index - currentIdx) * (width + padding) + currentDrag)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                currentDrag = value.translation.width
                            })
                            .onEnded({ value in
                                if currentDrag > width / 2 {
                                    if currentIdx > 0 {
                                        currentIdx -= 1
                                    }
                                } else if currentDrag < -width / 2 {
                                    if currentIdx < models.count - 1 {
                                        currentIdx += 1
                                    }
                                }
                                currentDrag = 0
                            })
                    )
                    .animation(.easeInOut(duration: 0.1), value: currentDrag)
                }
            }
            .offset(x: UIScreen.screenWidth / 2 - width / 2)
            .padding(.top, 70)
        }
    }
    
    func isCurrentIdx(to i: Int) -> Bool {
        return currentIdx == i
    }
}

struct ParalaxScrolling_ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ParalaxScrollView()
    }
}

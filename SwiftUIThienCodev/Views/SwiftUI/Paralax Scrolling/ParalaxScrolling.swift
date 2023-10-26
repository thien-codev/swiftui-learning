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
    let models = [Model(name: "Product A", color: .mint, price: "$3", description: "From Korea"),
                  Model(name: "Product B", color: .brown, price: "$8", description: "From Viet Nam"),
                  Model(name: "Product C", color: .cyan, price: "$6", description: "From Thailand"),
                  Model(name: "Product D", color: .indigo, price: "$4", description: "From Laos"),
                  Model(name: "Product E", color: .green, price: "$43", description: "From Cambodia"),
                  Model(name: "Product F", color: .purple, price: "$9", description: "From Timor Leste")]
    
    @State var currentIdx: Int = 0
    @State var currentDrag: CGFloat = 0
    @State var priceOffset: CGFloat = 0
    @State var isFavorite: Bool = false
    @State var pageOffset: CGFloat = 0
    @State var scale: CGFloat = 1
    @State var favoriteScale: CGFloat = 1
    @State var cardScale: CGFloat = 1
    @State var onTapItem: Bool = false
    
    let haflScreen: CGFloat = UIScreen.screenWidth / 2
    let padding: CGFloat = 80
    let width: CGFloat = 220
    let textColor: Color = Color(red: 0.262,
                                 green: 0.329,
                                 blue: 0.671)
    
    var body: some View {
        GeometryReader { view in
            Color(red: 0.52, green: 0.80, blue: 0.82).opacity(0.6).ignoresSafeArea()
            Circle().fill(.teal)
                .scaleEffect(isFavorite ? 6 : 1)
                .frame(width: 4000, height: 500)
                .position(x: view.size.width / 2, y: view.size.height)
                .animation(.easeInOut(duration: 0.6), value: isFavorite)
            VStack(alignment: .center, spacing: -80/2) {
                ZStack(alignment: .bottom) {
                    LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 290, height: UIScreen.screenHeight - 400)
                        .cornerRadius(18)
                        .background {
                            RoundedRectangle(cornerRadius: 18).shadow(radius: 0, x: 10, y: 10)
                                .foregroundColor(Color(red: 0.52, green: 0.80, blue: 0.82))
                        }
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(.teal)
                        .frame(height: 46)
                        .background(content: {
                            Circle().fill(.white)
                                .shadow(radius: 0,
                                        x: favoriteScale == 1 ? 0 : 6,
                                        y: favoriteScale == 1 ? 0 : 6)
                        })
                        .overlay {
                            Button {
                                isFavorite.toggle()
                                favoriteScale = 1.5
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                    favoriteScale = 1
                                }
                            } label: {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(.teal)
                            }
                        }
                        .scaleEffect(favoriteScale)
                        .animation(.easeInOut(duration: 0.4), value: favoriteScale)
                        .offset(x: 90)
                        .padding(.bottom, 20)
                    
                    Circle()
                        .stroke(lineWidth: 2)
                        .fill(.teal)
                        .frame(height: 46)
                        .background(content: {
                            Circle().fill(.white)
                                .shadow(radius: 0,
                                        x: cardScale == 1 ? 0 : 6,
                                        y: cardScale == 1 ? 0 : 6)
                        })
                        .overlay {
                            Button {
                                cardScale = 1.5
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                    cardScale = 1
                                }
                            } label: {
                                Image(systemName: "creditcard")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                                    .foregroundColor(.teal)
                            }
                        }
                        .scaleEffect(cardScale)
                        .animation(.easeInOut(duration: 0.4), value: cardScale)
                        .offset(x: -90)
                        .padding(.bottom, 20)
                    
                    VStack {
                        Text(models[currentIdx].description)
                            .font(Font.custom("Gill Sans", size: 20))
                            .foregroundColor(textColor.opacity(priceOffset == 0 ? 0.5 : CGFloat((haflScreen - abs(currentDrag)) / haflScreen)))
                            .fontWeight(.bold)
                            .offset(x: priceOffset * 8)
                        Text(models[currentIdx].name)
                            .font(Font.custom("Gill Sans", size: 40))
                            .foregroundColor(textColor.opacity(priceOffset == 0 ? 1 : CGFloat((haflScreen - abs(currentDrag)) / haflScreen)))
                            .fontWeight(.bold)
                            .offset(x: priceOffset * 8)
                        Spacer()
                            .frame(height: 20)
                        Text(models[currentIdx].price)
                            .font(Font.custom("Gill Sans", size: 60))
                            .foregroundColor(textColor.opacity(priceOffset == 0 ? 1 : CGFloat((haflScreen - abs(currentDrag)) / haflScreen)))
                            .fontWeight(.bold)
                            .offset(x: priceOffset * 8)
                    }
                    .offset(y: -(UIScreen.screenHeight - 400) / 3)
                    .animation(.easeInOut(duration: 0.4), value: priceOffset)
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
                    .background(content: {
                        Circle().shadow(radius: 0, x: 2, y: 10)
                    })
            }
            .offset(x: haflScreen - 145)
            .padding(.top, 200)
            
            let pageDotSpacing: CGFloat = 10
            HStack(spacing: pageDotSpacing) {
                ForEach(0..<models.count) { index in
                    Circle()
                        .stroke()
                        .foregroundColor(.white)
                        .frame(width: 10, height: 10)
                        .background {
                            Circle().fill(
                                getPageColor(for: index)
                            )
                            .offset(x: pageOffset)
                            .scaleEffect(scale)
                            .animation(.easeInOut(duration: 0.4), value: scale)
                        }
                }
            }
            .position(x: haflScreen)
            .padding(.top, 60)
            
            ZStack {
                ForEach(0..<models.count) { index in
                    ZStack() {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: width, height: width)
                            .foregroundColor(models[index].color)
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(.white.opacity( isCurrentIdx(to: index) ? 0 : 0.4))
                            }
                            .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.33).opacity( isCurrentIdx(to: index) ? 1 : 0.4), radius: 0, x: 10, y: 10)
                            .rotationEffect(Angle(degrees: getDregrees(of: index)))
                        
                        Text(models[index].name)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(width: width, height: width)
                    .offset(x: CGFloat(index - currentIdx) * (width + padding) + currentDrag, y: getYOffset(of: index))
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                currentDrag = value.translation.width
                                priceOffset = currentDrag / UIScreen.screenWidth * 24
                                withAnimation {
                                    if currentDrag > width / 2 {
                                        if currentIdx > 0 {
                                            pageOffset = -10 * currentDrag / haflScreen
                                            scale = 3
                                        }
                                    } else if currentDrag < -width / 2 {
                                        if currentIdx < models.count - 1 {
                                            pageOffset = -10 * currentDrag / haflScreen
                                            scale = 3
                                        }
                                    }
                                }
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
                                priceOffset = 0
                                pageOffset = 0
                                withAnimation {
                                    scale = 1
                                }
                            })
                    )
                    .onTapGesture {
                        onTapItem.toggle()
                    }
                    .animation(.easeInOut(duration: 0.4), value: currentDrag)
                }
            }
            .offset(x: haflScreen - width / 2)
            .padding(.top, 100)
        }
        .overlay {
            
        }
    }
    
    func getPageColor(for i: Int) -> Color {
        return isCurrentIdx(to: i) ? .white : .clear
    }
    
    func getYOffset(of i: Int) -> CGFloat {
        if currentIdx == i {
            return 0
        } else {
            return 60
        }
    }
    
    func getDregrees(of i: Int) -> CGFloat {
        if currentIdx == i {
            return 0
        } else if i > currentIdx {
            return 20
        } else {
            return -20
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

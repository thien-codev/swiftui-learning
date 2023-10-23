//
//  ContentView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 13/10/2023.
//

import SwiftUI
import Clock

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var rgbColor: Color = .black
    @State var redRatio: CGFloat = 0
    @State var greenRatio: CGFloat = 0
    @State var blueRatio: CGFloat = 0
    @State var onTapColor: Category?
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.backward").foregroundColor(.black)
        }
    }
    var body: some View {
        NavigationView {
            GeometryReader { view in
                ZStack(alignment: .top) {
                    Color(uiColor: UIColor.systemTeal.withAlphaComponent(0.4)).ignoresSafeArea()
                    VStack {
                        CustomViewSwiftUI(onTapColor: $onTapColor,
                                          redRatio: $redRatio,
                                          greenRatio: $greenRatio,
                                          blueRatio: $blueRatio,
                                          size: CGSize(width: UIScreen.screenWidth, height: 40))
                        .padding(.top, 10)
                        .padding([.leading, .trailing], 16)
                        .frame(height: 50)
                        if let onTapColor {
                            ZStack(alignment: .topTrailing) {
                                Rectangle()
                                    .fill(.opacity(0.2))
                                    .cornerRadius(8)
                                    .shadow(radius: 10)
                                    .frame(height: 60)
                                    .padding(.bottom, 34)
                                switch onTapColor {
                                case .red:
                                    SliderButton(color: Color(uiColor: onTapColor.color), ratio: $redRatio)
                                        .padding([.leading, .trailing], 16)
                                        .padding(.top, 14)
                                case .blue:
                                    SliderButton(color: Color(uiColor: onTapColor.color), ratio: $blueRatio)
                                        .padding([.leading, .trailing], 16)
                                        .padding(.top, 14)
                                case .green:
                                    SliderButton(color: Color(uiColor: onTapColor.color), ratio: $greenRatio)
                                        .padding([.leading, .trailing], 16)
                                        .padding(.top, 14)
                                }
                                
                                Button {
                                    self.onTapColor = nil
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 30, height: 30)
                                .buttonStyle(.plain)
                                
                            }
                            .padding([.leading, .trailing], 16)
                            .frame(height: 100)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 100)
                        }
                        
                        Circle()
                            .fill(rgbColor)
                            .frame(width: 300)
                            .shadow(color: rgbColor, radius: 30)
                            .gesture(
                                TapGesture()
                                    .onEnded { _ in
                                        redRatio = Double.random(in: 0...1)
                                        greenRatio = Double.random(in: 0...1)
                                        blueRatio = Double.random(in: 0...1)
                                    }
                            )
                        
                        VStack {
                            SliderButton(color: .red, ratio: $redRatio)
                            SliderButton(color: .green, ratio: $greenRatio)
                            SliderButton(color: .blue, ratio: $blueRatio)
                        }
                        .padding([.leading, .trailing], 20)
                        .padding(.top, 20)
                        .padding(.bottom, 0)
                    }
                }
                
                let width: CGFloat = 120
                let height: CGFloat = 60
                
                ClockManager.manager.view(width: width, height: height)
                    .padding(.top, view.size.height - height)
                    .padding(.leading, view.size.width - width - 20)
            }
            .navigationBarTitle(Text("Main").font(.subheadline), displayMode: .inline)
            .navigationBarItems(leading: backButton)
            .onChange(of: redRatio, perform: { newValue in
                rgbColor = Color(red: newValue, green: greenRatio, blue: blueRatio)
            })
            .onChange(of: greenRatio, perform: { newValue in
                rgbColor = Color(red: redRatio, green: newValue, blue: blueRatio)
            })
            .onChange(of: blueRatio, perform: { newValue in
                rgbColor = Color(red: redRatio, green: greenRatio, blue: newValue)
            })
        }
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderButton: View {
    @State var color: Color
    @Binding var ratio: CGFloat
    
    var body: some View {
        Slider(value: $ratio, in: 0...1)
            .accentColor(color)
    }
}

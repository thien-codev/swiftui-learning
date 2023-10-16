//
//  ContentView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 13/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    @ObservedObject private var appSetting = Settings.manager
    @State var isShowAlert: Bool = false
    @State var number: Int = 0
    @State var theme: Style = .colorful
    @State var color: Color = Style.colorful.backgroudColor
    
    var body: some View {
        ZStack {
            color.ignoresSafeArea()
            HStack {
                RadioButton(state: .dark, 
                            checked: $theme,
                            backgroundColor: .gray)
                RadioButton(state: .light, 
                            checked: $theme,
                            backgroundColor: Color(UIColor.lightGray.withAlphaComponent(0.7)))
                RadioButton(state: .colorful,
                            checked: $theme,
                            backgroundColor: .blue)
            }.position(x: 50, y: 20)
            HStack {
                CalculatorView(isShowAlert: $isShowAlert,
                               number: number)
                CalculatorView(isShowAlert: $isShowAlert,
                               number: number)
                CalculatorView(isShowAlert: $isShowAlert,
                               number: number)
            }
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("Notification"),
                      message: Text("Out of range \n \(number == 0 ? "You should go up" : "You should go down")"),
                      primaryButton: .default(Text("OK")),
                      secondaryButton: .cancel())
            })
            .onChange(of: theme) {
                color = theme.backgroudColor
            }
        }
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
            ContentView()
            .environment(\.colorScheme, .light)
    }
}

struct CalculatorView: View {
    
    @Binding var isShowAlert: Bool
    @State var number: Int
    
    var body: some View {
        VStack {
            Button(action: {
                if number < 20 {
                    number = number + 1
                } else {
                    isShowAlert = true
                }
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Text("\(number)")
                .foregroundColor(.gray)
                .font(.largeTitle)
                .fontWeight(.bold)
                
            Button(action: {
                if number > 0 {
                    number = number - 1
                } else {
                    isShowAlert = true
                }
            }) {
                Image(systemName: "minus")
                    .resizable()
                    .frame(width: 50, height: 7)
            }
            .padding(.all)
        }
    }
}

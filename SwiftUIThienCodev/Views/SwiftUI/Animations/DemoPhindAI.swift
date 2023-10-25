//
//  ContentView.swift
//  SwiftUICompass
//
//  Created by Shreyas Vilaschandra Bhike on 29/01/22.
//

import Foundation
import SwiftUI

struct LifeListView: View {
    @StateObject var viewModel = ViewModel.mock
    @State var seletecItem: MenuItem? = nil
    
    var tintColor: Color = .white
    var items: [MenuItem] { viewModel.dummyData }
    
    var body: some View {
        GeometryReader { view in
            ZStack(alignment: .topTrailing) {
                VStack(spacing: 0) {
                    generateView(from: items[0])
                    generateView(from: items[1])
                    generateView(from: items[2])
                    generateView(from: items[3])
                    generateView(from: items[4])
                }
                if seletecItem != nil {
                    Button(action: {
                        withAnimation {
                            seletecItem = nil
                        }
                    }, label: {
                        Image(systemName: "xmark")
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 20)
                    })
                    .padding(.top, 40)
                    .padding(.trailing, 10)
                }
            }
        }
        .ignoresSafeArea()
    }
    
    func generateView(from item: MenuItem) -> some View {
        ItemView(item: item,
                 color: item.color,
                 tintColor: tintColor,
                 tapped: Binding<Bool>(get: {
            seletecItem?.title == item.title
        }, set: { value, _ in
            withAnimation {
                if seletecItem?.title == item.title {
                    seletecItem = nil
                } else {
                    seletecItem = item
                }
            }
        }))
    }
}
struct ItemView: View {
    @State var item: MenuItem
    @State var color: Color
    @State var tintColor: Color
    @Binding var tapped: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            color
            VStack(alignment: .leading, spacing: 0) {
                Text("\(item.title)")
                    .padding(.leading, 20)
                    .font(Font.custom("Impact", size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(tintColor)
                    .frame(height: 100)
                if let subMenu = item.subMenu {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(subMenu) { subItem in
                            Text("\(subItem.title)")
                                .padding(.leading, 20)
                                .font(Font.system(size: 22))
                                .foregroundColor(tapped ? tintColor : .clear)
                                .frame(height: tapped ? 40 : 0)
                        }
                        .offset(y: -20)
                    }.padding(.top, tapped ? 20 : 0)
                }
            }
        }
        .onTapGesture {
            withAnimation {
                tapped.toggle()
            }
        }
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        LifeListView()
    }
}

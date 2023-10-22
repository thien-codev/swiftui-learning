//
//  Test.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 22/10/2023.
//

import Foundation
import SwiftUI

struct Test: View {
    @State var item = ViewModel.mock.dummyData[1]
    @State var tapped: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            Item(item: item,
                 color: item.color,
                 height: 200,
                 tapped: $tapped,
                 tintColor: .white)
            .frame(height: 200)
        }
    }
}

struct Item: View {
    @State var item: MenuItem
    @State var color: Color
    @State var height: CGFloat
    @Binding var tapped: Bool
    @State var tintColor: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            color
            VStack(alignment: .leading, spacing: 0) {
                Text("\(item.title)")
                    .padding(.leading, 20)
                    .font(Font.custom("Impact", size: 40))
                    .fontWeight(.heavy)
                    .foregroundColor(tintColor)
                    .frame(height: height)
                if tapped,  let subMenu = item.subMenu {
                    ForEach(subMenu) { subItem in
                        Text("\(subItem.title)")
                            .padding(.leading, 20)
                            .font(Font.system(size: 22))
                            .foregroundColor(tintColor)
                            .frame(height: tapped ? 40 : 0)
                    }
                    .offset(y: -20)
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


#Preview {
    Test()
}

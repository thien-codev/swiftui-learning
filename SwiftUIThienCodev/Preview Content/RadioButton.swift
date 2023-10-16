//
//  RadioButton.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 15/10/2023.
//

import SwiftUI

struct RadioButton: View {
    
    @State var state: Style
    @Binding var checked: Style
    @State var backgroundColor: Color
    
    var body: some View {
        Group{
            if checked == state {
                ZStack{
                    Circle()
                        .fill(backgroundColor.opacity(0.4))
                        .frame(width: 20, height: 20)
                    Circle()
                        .fill(backgroundColor)
                        .frame(width: 10, height: 10)
                }
            } else {
                Circle()
                    .fill(backgroundColor.opacity(0.4))
                    .frame(width: 20, height: 20)
                    .onTapGesture {self.checked = state}
            }
        }
    }
}

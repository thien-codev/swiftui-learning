//
//  CustomViewSwiftUI.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 16/10/2023.
//

import Foundation
import SwiftUI

struct CustomViewSwiftUI: UIViewRepresentable {
    
    @Binding var onTapColor: Category?
    @Binding var redRatio: CGFloat
    @Binding var greenRatio: CGFloat
    @Binding var blueRatio: CGFloat
    @State var size: CGSize
    
    func makeUIView(context: Context) -> CustomView {
        return CustomView(size: size,
                          redRatio: redRatio.toHexColorValue,
                          greenRatio: greenRatio.toHexColorValue,
                          blueRatio: blueRatio.toHexColorValue) { category in
            onTapColor = category
        }
    }
    
    func updateUIView(_ uiView: CustomView, context: Self.Context) {
        uiView.updateHexColor(for: .red, with: redRatio.toHexColorValue)
        uiView.updateHexColor(for: .green, with: greenRatio.toHexColorValue)
        uiView.updateHexColor(for: .blue, with: blueRatio.toHexColorValue)
    }
}

extension CGFloat {
    var toHexColorValue: Int {
        return Int(255 * self)
    }
}

//
//  DetailView.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 21/10/2023.
//

import Foundation
import SwiftUI

struct AnimationValues {
    var scale = 1.0
    var verticalStretch = 1.0
    var verticalTranslation = 0.0
    var angle = Angle.zero
}

struct ExpanedView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var isFavorite: Bool
    @Binding var tap: Bool
    
    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "arrow.backward").foregroundColor(.black)
        }
        
    }
    
    var body: some View {
        VStack {
//            Spacer()
            HStack(spacing: 10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(Color(UIColor.systemPink).opacity(0.8))
                    .background(Circle().shadow(radius: 0, x: 5, y: 5).foregroundColor(.teal))
                VStack(alignment: .leading) {
                    Text("Thien")
                        .fontWeight(.medium)
                        .font(Font.system(size: 26))
                        .foregroundColor(.white)
                    Text("iOS Developer")
                        .font(Font.system(size: 18))
                        .foregroundColor(.white.opacity(0.5))
                }
                Spacer()
                Button(action: {
                    isFavorite.toggle()
                }, label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(.white)
                })
            }
            .padding()
//            Spacer()
        }
        .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).shadow(radius: 0, x: 6, y: 8).foregroundColor(.teal))
        .onTapGesture {
            withAnimation {
                tap = false
            }
        }
        .navigationBarItems(leading: backButton)
        .padding()
        .keyframeAnimator(initialValue: AnimationValues()) { content, value in
            content
                .foregroundStyle(.red)
                .rotationEffect(value.angle)
                .scaleEffect(value.scale)
                .scaleEffect(y: value.verticalStretch)
                .offset(y: value.verticalTranslation)
        } keyframes: { _ in
            KeyframeTrack(\.angle) {
                CubicKeyframe(.zero, duration: 0.58)
                CubicKeyframe(.degrees(16), duration: 0.125)
                CubicKeyframe(.degrees(-16), duration: 0.125)
                CubicKeyframe(.degrees(16), duration: 0.125)
                CubicKeyframe(.zero, duration: 0.125)
            }
            KeyframeTrack(\.verticalStretch) {
                CubicKeyframe(1.0, duration: 0.1)
                CubicKeyframe(0.6, duration: 0.15)
                CubicKeyframe(1.5, duration: 0.1)
                CubicKeyframe(1.05, duration: 0.15)
                CubicKeyframe(1.0, duration: 0.88)
                CubicKeyframe(0.8, duration: 0.1)
                CubicKeyframe(1.04, duration: 0.4)
                CubicKeyframe(1.0, duration: 0.22)
            }
            KeyframeTrack(\.scale) {
                LinearKeyframe(1.0, duration: 0.36)
                SpringKeyframe(1.5, duration: 0.8, spring: .bouncy)
                SpringKeyframe(1.0, spring: .bouncy)
            }
            KeyframeTrack(\.verticalTranslation) {
                LinearKeyframe(0.0, duration: 0.1)
                SpringKeyframe(20.0, duration: 0.15, spring: .bouncy)
                SpringKeyframe(-60.0, duration: 1.0, spring: .bouncy)
                SpringKeyframe(0.0, spring: .bouncy)
            }
        }
    }
}

#Preview {
    @State var isFavorite: Bool = true
    @State var tap: Bool = true
    return ExpanedView(isFavorite: $isFavorite, tap: $tap)
}

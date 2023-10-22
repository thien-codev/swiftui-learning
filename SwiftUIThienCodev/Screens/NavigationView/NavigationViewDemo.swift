//
//  NavigationViewDemo.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 20/10/2023.
//

import Foundation
import SwiftUI

struct NavigationViewDemo: View {
    
    @ObservedObject var vm: NavigationVM
    @State var isFavorite: Bool = true
    @State var tap: Bool = true
    
    init() {
        vm = NavigationVM()
    }
    
    var backButton: some View {
        Button {
            print("Tap back button!!")
        } label: {
            Image(systemName: "arrow.backward").foregroundColor(.black)
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List (0..<10) { index in
                    ZStack {
                            Cell(isFavorite: $isFavorite).font(.title)
                        NavigationLink {
                            ExpanedView(isFavorite: $isFavorite, tap: $tap).navigationBarBackButtonHidden()
                        } label: { EmptyView() }
                            .opacity(0)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .buttonStyle(.plain)
            }
            .navigationBarTitle(Text("List"), displayMode: .inline)
            .navigationBarItems(leading: backButton)
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        NavigationViewDemo()
    }
}

struct Cell: View {
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
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
        }
        .listRowSeparator(.hidden)
        .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).shadow(radius: 0, x: 6, y: 8).foregroundColor(.teal))
    }
}

//
//  ContentView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 13/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .foregroundColor(.red)
        }
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 568, height: 320))
        }
    }
}

//
//  NavigationVM.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 21/10/2023.
//

import Foundation
import SwiftUI

class NavigationVM: ObservableObject {
    
}

extension NavigationVM {
    var list: [DataModel] {
        [DataModel(image: "person.circle", title: "Nu", description: "iOS Developer", isFavorite: true),
         DataModel(image: "person.circle", title: "Na", description: "BA Specialist", isFavorite: true),
         DataModel(image: "person.circle", title: "Phuc", description: "PHP Developer", isFavorite: false),
         DataModel(image: "person.circle", title: "Bao", description: "Architect", isFavorite: false),
         DataModel(image: "person.circle", title: "Thuong", description: "Marketing Event", isFavorite: true),
         DataModel(image: "person.circle", title: "Thang", description: "Coffee Shop Director", isFavorite: false),
         DataModel(image: "person.circle", title: "Tung", description: "Web Developer", isFavorite: false),
         DataModel(image: "person.circle", title: "Trinh", description: "Tester", isFavorite: false)]
    }
}

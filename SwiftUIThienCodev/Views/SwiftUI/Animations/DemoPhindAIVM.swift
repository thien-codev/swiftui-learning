//
//  ViewModel.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 22/10/2023.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    static var mock = ViewModel()
}

extension ViewModel {
    var dummyData: [MenuItem] {
        let firstColor = Color.green
        let fisrt = MenuItem(color: firstColor, title: "HEALTHCARE", subMenu: [.init(color: firstColor, title: "Skin"),
                                                                               .init(color: firstColor, title: "Eye"),
                                                                               .init(color: firstColor, title: "Personal care"),
                                                                               .init(color: firstColor, title: "Mental health")])
        let secondColor = Color.teal
        let second = MenuItem(color: secondColor, title: "FOOD & DRINK", subMenu: [.init(color: secondColor, title: "Breads"),
                                                                                   .init(color: secondColor, title: "Cereals"),
                                                                                   .init(color: secondColor, title: "Dairy products"),
                                                                                   .init(color: secondColor, title: "Edible plants"),
                                                                                   .init(color: secondColor, title: "Edible fungi"),
                                                                                   .init(color: secondColor, title: "Edible nuts and seeds"),
                                                                                   .init(color: secondColor, title: "Legumes"),
                                                                                   .init(color: secondColor, title: "Meat")])
        let thirdColor = Color.blue
        let third = MenuItem(color: thirdColor, title: "BEAUTY", subMenu: [.init(color: thirdColor, title: "Major"),
                                                                           .init(color: thirdColor, title: "Most victorious countries"),
                                                                           .init(color: thirdColor, title: "Minor"),
                                                                           .init(color: thirdColor, title: "Continental, regional, sub-regional"),
                                                                           .init(color: thirdColor, title: "Marital")])
        let forthColor = Color.pink
        let forth = MenuItem(color: forthColor, title: "BABY & KIDS", subMenu: [.init(color: forthColor, title: "Wardrobe"),
                                                                                .init(color: forthColor, title: "Nursery"),
                                                                                .init(color: forthColor, title: "Diapering"),
                                                                                .init(color: forthColor, title: "Feeding")])
        let fifthColor = Color.yellow
        let fifth = MenuItem(color: fifthColor, title: "HOMEWARES", subMenu: [.init(color: fifthColor, title: "Stunning vase"),
                                                                              .init(color: fifthColor, title: "Rustic rug")])
        
        return [fisrt, second, third, forth, fifth]
    }
}

struct MenuItem: Hashable, Identifiable {
    var id = UUID()
    
    var color: Color
    var title: String
    var subMenu: [MenuItem]? = []
}

extension MenuItem {
    var subHeight: CGFloat {
        guard let subMenu else { return 0 }
        return CGFloat(subMenu.count * 40)
    }
}

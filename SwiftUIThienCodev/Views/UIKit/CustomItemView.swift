//
//  CustomItemView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 16/10/2023.
//

import Foundation
import UIKit

enum Category {
    case red
    case green
    case blue
    
    var color: UIColor {
        switch self {
        case .red: return .red
        case .green: return .systemGreen
        case .blue: return .blue
        }
    }
    
    var titleFormat: String {
        switch self {
        case .red: return "Red: %d"
        case .green: return "Green: %d"
        case .blue: return "Blue: %d"
        }
    }
}

class CustomItemView: UIView {
    
    @IBOutlet private weak var textlabel: UILabel!
    
    var onTap: ((Category) -> Void)?
    var category: Category = .red
    
    init(size: CGSize, category: Category, hexColor: Int, onTap: ((Category) -> Void)?) {
        super.init(frame: CGRect(origin: .zero, size: size))
        self.onTap = onTap
        self.category = category
        self.commonSetup()
        self.updateLabel(hexValue: hexColor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonSetup()
    }
    
    func updateLabel(hexValue: Int) {
        textlabel.text = String(format: category.titleFormat, hexValue)
    }
    
    func commonSetup() {
        guard let view = Bundle.main.loadNibNamed("CustomItemView", owner: self, options: nil)?.first as? UIView else { return }
        view.dropShadow(cornerRadius: 0, shadowOffset: .init(width: 6, height: 6))
        view.borderColour = category.color
        view.backgroundColor = category.color.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.anchorWithOffset(to: topAnchor).constraint(equalToConstant: 0).isActive = true
        view.leadingAnchor.anchorWithOffset(to: leadingAnchor).constraint(equalToConstant: 0).isActive = true
        view.trailingAnchor.anchorWithOffset(to: trailingAnchor).constraint(equalToConstant: 0).isActive = true
        view.bottomAnchor.anchorWithOffset(to: bottomAnchor).constraint(equalToConstant: 0).isActive = true
    }
    
    @IBAction func onTap(_ sender: Any) {
        onTap?(category)
    }
}

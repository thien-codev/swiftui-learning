//
//  CustomView.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 16/10/2023.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    @IBOutlet private var stack: UIStackView!
    
    var onTap: ((Category) -> Void)?
    
    var subItemViews: [CustomItemView] = []
    
    init(size: CGSize, spacing: CGFloat = 10, redRatio: Int, greenRatio: Int, blueRatio: Int, onTap: ((Category) -> Void)?) {
        super.init(frame: CGRect(origin: .zero, size: size))
        self.commonSetup()
        self.backgroundColor = .clear
        let itemWidth = (size.width - spacing * 2) / 3
        let itemHeight = size.height
        let itemSize = CGSize(width: itemWidth, height: itemHeight)
        subItemViews = [CustomItemView(size: itemSize, category: .red, hexColor: redRatio, onTap: onTap),
                        CustomItemView(size: itemSize, category: .green, hexColor: greenRatio, onTap: onTap),
                        CustomItemView(size: itemSize, category: .blue, hexColor: blueRatio, onTap: onTap)]
        subItemViews.forEach({ stack.addArrangedSubview($0) })
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonSetup()
    }
    
    func commonSetup() {
        guard let view = Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)?.first as? UIView else { return }
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.topAnchor.anchorWithOffset(to: topAnchor).constraint(equalToConstant: 0).isActive = true
        view.leadingAnchor.anchorWithOffset(to: leadingAnchor).constraint(equalToConstant: 0).isActive = true
        view.trailingAnchor.anchorWithOffset(to: trailingAnchor).constraint(equalToConstant: 0).isActive = true
        view.bottomAnchor.anchorWithOffset(to: bottomAnchor).constraint(equalToConstant: 0).isActive = true
    }
    
    func updateHexColor(for category: Category, with hexString: Int) {
        subItemViews.first(where: { $0.category == category })?.updateLabel(hexValue: hexString)
    }
}


//
//  UIDevice+Extensions.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 22/10/2023.
//

import Foundation
import UIKit

extension UIScreen {
    public static var screenHeight: CGFloat { UIScreen.main.bounds.size.height }
    public static var screenWidth: CGFloat { UIScreen.main.bounds.size.width }
    public static var safeAreaTop: CGFloat { UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0 }
    public static var safeAreaBottom: CGFloat { UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 }
}

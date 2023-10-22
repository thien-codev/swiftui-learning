//
//  UserView.swift
//  SwiftUIThienCodev
//
//  Created by Nguyen Thien on 16/10/2023.
//

import Foundation
import UIKit

class UserView: UIView {
    
    @IBOutlet weak var focusView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "UserView", bundle: nil)
        if let view = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UIView {
            view.backgroundColor = UIColor.clear
            addSubview(view)
            view.frame = self.bounds
            self.backgroundColor = UIColor.cyan
        }
    }
    
    @IBAction func red(_ sender: Any) {
        focusView.backgroundColor = .red
    }
    
    @IBAction func green(_ sender: Any) {
        focusView.backgroundColor = .green
    }
    
    @IBAction func blue(_ sender: Any) {
        focusView.backgroundColor = .blue
    }
}

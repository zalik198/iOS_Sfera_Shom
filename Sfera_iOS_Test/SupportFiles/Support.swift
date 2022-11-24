//
//  Support.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 24.11.2022.
//

import UIKit

public extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
}

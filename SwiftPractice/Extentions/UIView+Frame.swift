//
//  UIView+Frame.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 04/12/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviewWithPosition(_ view: UIView) {
        let originalFrame = view.frame
        self.addSubview(view)
        view.frame = originalFrame
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
}

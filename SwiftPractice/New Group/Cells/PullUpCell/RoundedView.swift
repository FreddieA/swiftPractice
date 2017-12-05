//
//  UIView+Rounded.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 05/12/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
}

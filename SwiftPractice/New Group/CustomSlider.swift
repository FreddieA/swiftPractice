//
//  CustomUISlider.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 09/11/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import Foundation
import UIKit

class CustomSlider: UISlider
{
    public struct SliderConfig {
        var tintColor: UIColor
        var handleRadius: CGFloat
        var strokeWidth: CGFloat

        public init(tintColor: UIColor = UIColor.red,
                    handleRadius: CGFloat = 15.0,
                    strokeWidth: CGFloat = 1.0) {
            self.tintColor = tintColor
            self.handleRadius = handleRadius
            self.strokeWidth = strokeWidth
        }

        public func createHandle() -> UIImage {
            let rect = CGRect(x: 0, y: 0,
                              width: self.handleRadius * 2.0 ,
                              height: self.handleRadius * 2.0)
            UIGraphicsBeginImageContext(rect.size)
            let context = UIGraphicsGetCurrentContext()!
            context.setFillColor(self.tintColor.cgColor)
            context.setStrokeColor(self.tintColor.cgColor)
            context.addEllipse(in: CGRect(x:strokeWidth, y:strokeWidth,
                                          width:rect.width - strokeWidth * 2,
                                          height:rect.height - strokeWidth * 2))
            context.drawPath(using: .fillStroke)
            context.strokePath()

            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image!
        }
    }

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: 5)
    }

    override func awakeFromNib() {
        super .awakeFromNib()
        self.customizeAppearance()
    }

    public func customizeAppearance(with config: SliderConfig = SliderConfig.init()) {
        self.setThumbImage(config.createHandle(), for: .normal)
    }
}

//
//  TranparentSlider.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 09/11/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import Foundation
import UIKit

extension CustomSlider.SliderConfig
{
    public init(with opacity: CGFloat) {
        self.init()
        self.tintColor = self.tintColor.withAlphaComponent(opacity)
    }

    override func barHeight() -> CGFloat {
        return 50
    }
}

class TransparentSlider: CustomSlider
{
    override func customizeAppearance(with config: CustomSlider.SliderConfig) {
        super .customizeAppearance(with: CustomSlider.SliderConfig.init(with: 0.2))
    }
}

//func initWithOpacity(opacity: Float) -> CustomSlider.SliderConfig {
//    var config = CustomSlider.SliderConfig.init()
//    config.tintColor = UIColor.red
//    return config
//}


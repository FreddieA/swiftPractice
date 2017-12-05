//
//  PullUpTableViewCell.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 30/11/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit

class PullUpTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLabel: UILabel?
    @IBOutlet weak var textPlaceholderView : UIView?
    @IBOutlet weak var iconPlaceholderView: UIView?
    @IBOutlet weak var iconImageView: UIImageView?

    func unwrap(animated: Bool) {

        UIView.animate(withDuration: 0.3) {
            self.titleTextLabel?.frame = (self.textPlaceholderView?.frame)!
        }

        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 10,
                       options: .curveEaseInOut,
                       animations: {
                        self.iconPlaceholderView?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }) { _ in }
    }

    func wrap(animated: Bool) {
        iconPlaceholderView?.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        titleTextLabel?.frame = CGRect.init(x: (textPlaceholderView?.frame.maxX)!,
                                            y: (textPlaceholderView?.frame.origin.y)!,
                                            width: 0.0,
                                            height: (textPlaceholderView?.frame.height)!)
    }
}

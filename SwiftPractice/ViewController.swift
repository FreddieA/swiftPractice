//
//  ViewController.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 24/10/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet weak var animatableView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.animatableView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
    }

    @IBAction func animateAction(sender: UIButton) {
        self.animatableView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.animatableView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }) { _ in
            //self.viewToAnimate.removeFromSuperview()
        }
    }
}




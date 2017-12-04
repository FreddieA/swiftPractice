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
    @IBOutlet weak var pullUpButton: UIButton!
    @IBOutlet weak var optionsAnimator: PullUpOptionsAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.animatableView.transform = CGAffineTransform.init(scaleX: 0, y: 0)

        optionsAnimator.configure(options: ["dsf", "hj", "wer", "dsf"], handler: { option in })
    }

//    @IBAction func animateAction(sender: UIButton) {
    //                self.animatableView.transform = CGAffineTransform.init(scaleX: 0, y: 0)@objc 
//                        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
//                    self.animatableView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
//                }) { _ in
//                    //self.viewToAnimate.removeFromSuperview()
//                }
//
//
//            func showTable(control: UIControl) {
//                let table = UITableView.init(frame: CGRect.zero)
//                table.backgroundColor = UIColor.clear
//                table.dataSource = self
//                table.showsHorizontalScrollIndicator = false
//                table.reloadData()
//                table.frame = CGRect.init(x: 0, y: control.frame.origin.y - table.contentSize.height,
//                                          width: (coveringWindow?.frame.width)!,
//                                          height: table.contentSize.height)
//                self.coveringWindow?.addSubview(table)
//            }
//    }
}




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

    var coveringWindow: UIWindow?

    func coverEverything() {
        coveringWindow = UIWindow(frame: (view.window?.frame)!)

        if let coveringWindow = coveringWindow {
            coveringWindow.windowLevel = UIWindowLevelAlert + 1
            coveringWindow.isHidden = false
            //coveringWindow.alpha = 0.0
            coveringWindow.backgroundColor = UIColor(white: 1, alpha: 0.5)

            UIView.animate(withDuration: 0.3, animations: {
                //coveringWindow.alpha = 0.7
            })
        }
    }

    @IBAction func animateAction(sender: UIButton) {
//        self.animatableView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
//        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
//            self.animatableView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
//        }) { _ in
//            //self.viewToAnimate.removeFromSuperview()
//        }

        guard (coveringWindow != nil) else {
            coveringWindow?.isHidden = true
            return
        }

        self.coverEverything()
        coveringWindow?.addSubview(sender)

        //self.showTable(control: sender)
    }


    func showTable(control: UIControl) {
        let frame = CGRect.init(x: 0, y: 0, width: (coveringWindow?.frame.width)!, height: (coveringWindow?.frame.height)! - 60)
        let table = UITableView.init(frame: frame)
        table.dataSource = self
        coveringWindow?.addSubview(table)
        table.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "asdasdasddasd as asd as das"
        return cell
    }
}




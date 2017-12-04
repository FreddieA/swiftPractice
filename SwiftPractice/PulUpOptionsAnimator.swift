//
//  PulUpOptionsAnimator.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 04/12/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit

@objc
class PullUpOptionsAnimator: NSObject {

    private var coveringWindow: UIWindow
    private var selectionHandler: (Any) -> Void = {_ in }
    private var options: Array<Any> = []

    @IBOutlet weak var handle: UIControl?
    @IBOutlet weak var placeholder: UIView?

    override init() {
        coveringWindow = UIWindow(frame: UIScreen.main.bounds)
        coveringWindow.windowLevel = UIWindowLevelAlert + 1
    }

    func configure(options: Array<Any>, handler: @escaping (Any) -> Void) {
        self.options = options
        self.selectionHandler = handler

        handle?.translatesAutoresizingMaskIntoConstraints = false
        handle?.addTarget(self, action: #selector(self.animateAction(sender:)), for: UIControlEvents.touchUpInside)
    }

    func showCoveringWindow() {
        coveringWindow.isHidden = false
        coveringWindow.backgroundColor = UIColor.clear
        UIView.animate(withDuration: 0.3, animations: {
            self.coveringWindow.backgroundColor = UIColor(white: 1, alpha: 0.5)
        })
    }

    func hide() {
        coveringWindow.subviews.forEach({
            $0.removeFromSuperview()
        })
        coveringWindow.isHidden = true
    }

    // MARK: - show/hide action
    @objc func animateAction(sender: UIButton) {
        if coveringWindow.isHidden {
            self.showCoveringWindow()
            self.showTable(control: sender)
            self.coveringWindow.addSubview(sender)
            let rect = sender.frame
            self.coveringWindow.layoutSubviews()
            sender.frame = rect
        } else {
            let rect = sender.frame
            placeholder?.addSubview(sender)
            placeholder?.layoutSubviews()
            sender.frame = rect
            self.hide()
        }
    }

    //MARK: - table
    func showTable(control: UIControl) {
        let table = UITableView.init(frame: CGRect.zero)
        table.backgroundColor = UIColor.clear
        table.dataSource = self
        table.delegate = self
        table.showsHorizontalScrollIndicator = false
        table.isScrollEnabled = false
        table.tableFooterView = UIView.init()
        table.reloadData()
        table.frame = CGRect.init(x: 0, y: control.frame.origin.y - table.contentSize.height,
                                  width: coveringWindow.frame.width,
                                  height: table.contentSize.height + 8)
        coveringWindow.addSubview(table)
    }
}

extension PullUpOptionsAnimator: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = "asdasdasddasd as asd as das"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = options[indexPath.row]
        self.selectionHandler(option)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

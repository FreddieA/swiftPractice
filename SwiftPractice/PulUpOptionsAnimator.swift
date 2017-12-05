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
    private var table: UITableView?
    private var handleRect: CGRect?
    
    @IBOutlet weak var handle: UIControl?
    @IBOutlet weak var placeholder: UIView?
    
    override init() {
        coveringWindow = UIWindow(frame: UIScreen.main.bounds)
        coveringWindow.windowLevel = UIWindowLevelAlert + 1
        super.init()
    }

    func configureTable() {
        table = UITableView.init(frame: CGRect.zero)
        table?.backgroundColor = UIColor.clear
        table?.dataSource = self
        table?.delegate = self
        table?.isScrollEnabled = false
        table?.separatorStyle = .none
        table?.register(UINib.init(nibName: String(describing: PullUpTableViewCell.self), bundle: Bundle.main),
                        forCellReuseIdentifier: String(describing: PullUpTableViewCell.self))
        table?.tableFooterView = UIView.init()
        table?.addObserver(self, forKeyPath: #keyPath(UITableView.contentSize), options: .new, context: nil)
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

    // MARK: - observe tableview contentsize
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let obj = object as? UITableView {
            if obj == self.table && keyPath == #keyPath(UITableView.contentSize) {
                if let newSize = change?[NSKeyValueChangeKey.newKey] as? CGSize {

                    let originY = (handleRect?.minY)! - newSize.height
                    self.table?.frame = CGRect.init(x: 0, y: originY, width: UIScreen.main.bounds.width, height: newSize.height)
                }
            }
        }
    }
    
    // MARK: - show/hide action
    @objc func animateAction(sender: UIButton) {
        if handleRect == nil {
            handleRect = sender.frame
        }

        if coveringWindow.isHidden {
            self.showCoveringWindow()
            self.showTable()

            self.coveringWindow.addSubview(handle!)
            self.coveringWindow.setNeedsLayout()
            self.coveringWindow.layoutIfNeeded()
            self.handle?.frame = handleRect!

            self.animateTable()
        } else {
            placeholder?.addSubview(handle!)
            placeholder?.setNeedsLayout()
            placeholder?.layoutIfNeeded()
            self.handle?.frame = handleRect!

            self.hide()
        }
    }
    
    //MARK: - table
    func showTable() {
        if table == nil {
            self.configureTable()
        }

        table?.reloadData()
        coveringWindow.addSubview(table!)
    }

    func animateTable() {
        for cell in (table?.visibleCells)! {
            let pullUpCell = (cell as! PullUpTableViewCell)
            pullUpCell.wrap(animated: false)

            let index = Double(options.count) - Double((self.table?.indexPath(for: cell)?.row)!)
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(index) * 0.2 , execute: {
                    pullUpCell.unwrap(animated: true)
            })
        }
    }

    deinit {
        table?.removeObserver(self, forKeyPath: #keyPath(UITableView.contentSize))
    }
}

extension PullUpOptionsAnimator: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: String(describing: PullUpTableViewCell.self), for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = options[indexPath.row]
        self.selectionHandler(option)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

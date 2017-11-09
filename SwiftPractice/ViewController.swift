//
//  ViewController.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 24/10/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testFunc { Pstring in
            NSLog(Pstring)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testFunc(completion: @escaping (String) -> Void) {
        completion("String" + "OtherString")
    }

}




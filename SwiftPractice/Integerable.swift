//
//  Integerable.swift
//  SwiftPractice
//
//  Created by Mikhail Kirillov on 02/11/2017.
//  Copyright © 2017 Mikhail Kirillov. All rights reserved.
//

import Foundation

protocol Integerable {
    func integerValue() -> Int?
}

extension String: Integerable {
    func integerValue() -> Int? {
        return (self as NSString).integerValue
    }
}

extension NSNumber: Integerable {
    func integerValue() -> Int? {
        return self.intValue
    }
}

extension NSInteger: Integerable {
    func integerValue() -> Int? {
        return self
    }
}

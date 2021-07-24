//
//  Protocols.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 20.07.2021.
//

import UIKit

protocol Presentable {
    func present(from vc: UIViewController)
}

protocol Dismissible {
    func dismiss()
}

protocol Stubbable {
    static func stub() -> Self
}

extension Stubbable {
    func setting<T>(_ keyPath: WritableKeyPath<Self, T>,
                    to value: T) -> Self {
        var stub = self
        stub[keyPath: keyPath] = value
        return stub
    }
}


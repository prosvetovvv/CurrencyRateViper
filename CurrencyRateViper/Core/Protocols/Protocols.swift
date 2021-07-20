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

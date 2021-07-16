//
//  Collection+Ext.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 15.07.2021.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

//
//  DetailDetailViewInput.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

protocol DetailViewInput: AnyObject, Presentable, Dismissible {
        
    func setupInitialState()
}

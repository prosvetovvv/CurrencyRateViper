//
//  BaseParameters.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 22.07.2021.
//

import Foundation

struct BaseRequestParameters {
    static var url: String {
        "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&"
    }
    
    static var headers: [String : String] {
        ["Content-Type": "application/json",
         "Accept": "application/json",
         "User-Agent": "Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)"
        ]
    }
}

struct UrlParameters {
    static let rates = "t=ExchangeRates&v=44"
}

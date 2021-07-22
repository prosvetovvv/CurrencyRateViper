//
//  RequestProviding.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 27.05.2021.
//

import Foundation

protocol RequestProviding {
    var urlRequest: URLRequest { get }
}

extension Endpoint: RequestProviding {
    var urlRequest: URLRequest {
        switch self {
        case .rates:
            let urlString = BaseRequestParameters.url + UrlParameters.rates
            
            guard let url = URL(string: urlString) else {
                preconditionFailure(CRError.invalidResponse.rawValue)
            }
            
            guard let jsonData = try? JSONEncoder().encode(RequestExchangeRates()) else {
                preconditionFailure(CRError.invalidResponse.rawValue)
            }
            
            var request = URLRequest(url: url)
            
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = BaseRequestParameters.headers
            request.httpBody = jsonData
            
            return request
        }
    }
}

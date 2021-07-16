//
//  FeedProviding.swift
//  CurrencyRateTestForMKB
//
//  Created by Vitaly Prosvetov on 26.05.2021.
//

import Foundation

enum Endpoint {
    case rates
}

enum CRError: String, Error {
    case unableToComplete   = "Невозможно сделать запрос. Пожалуйста, проверьте соединение."
    case invalidResponse    = "Неправильный запрос. Пожалуйста, попробуйте еще."
    case invalidData        = "Получены некорректные данные от сервера. Пожалуйста, попробуйте еще."
}

protocol RateProviding {
    var network: Networking { get }
    
    func getRate(_ completion: @escaping (Result<RateResponse, CRError>) -> Void)
}

extension RateProviding {    
    func getRate(_ completion: @escaping (Result<RateResponse, CRError>) -> Void) {
        network.execute(Endpoint.rates, completion: completion)
    }
}








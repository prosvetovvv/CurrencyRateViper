//
//  RatesRatesPresenterTests.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import XCTest
@testable import CurrencyRateViper

class RatesViewMock: RatesViewInput {
    func setupInitialState() {
    }
    
    func ratesUpdated() {
    }
    
    func ratesLoadError(_ error: CRError) {
    }
}

class RatesInteractorMock: RatesInteractorInput {
    func loadRates() {
    }
}

class RatesRouterMock: RatesRouterInput {
    func showDetail(with rate: Rate) {
    }
}

class RatesPresenterTest: XCTestCase {
    var sut: RatesPresenter!
    
    override func setUp() {
        super.setUp()
        sut = RatesPresenter()
        sut.view = RatesViewMock()
        sut.interactor = RatesInteractorMock()
        sut.router = RatesRouterMock()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - getCountryCode
    
    func testCurrencyCodeCNYIsCountryCodeCN() throws {
       let rawRate = RawRate
        .stub()
        .setting(\.currencyCodeTo, to: "CNY")
        
        sut.handleRatesLoaded([rawRate])
        
        let country = sut.getRates().first?.country
        
        XCTAssertEqual(country, "CN")
    }
    
    // MARK: - formatPrice
    
    func testFormatRawPriceToRURPrice() throws {
        let rawRate = RawRate
            .stub()
            .setting(\.currencyCodeFrom, to: .rur)
            .setting(\.buy, to: "34.4567")
        
        sut.handleRatesLoaded([rawRate])
        
        let formattedPrice = sut.getRates().first?.buyPrice
        
        XCTAssertEqual(formattedPrice, "₽34.45")
    }
    
    func testFormatRawPriceToUSDPrice() throws {
            let rawRate = RawRate
                .stub()
                .setting(\.currencyCodeFrom, to: .usd)
                .setting(\.buy, to: "7.2354367")
            
            sut.handleRatesLoaded([rawRate])
            
            let formattedPrice = sut.getRates().first?.buyPrice
            
            XCTAssertEqual(formattedPrice, "$7.23")
    }
    
    func testFormatRawPriceToGBPPrice() throws {
            let rawRate = RawRate
                .stub()
                .setting(\.currencyCodeFrom, to: .gbp)
                .setting(\.buy, to: "13.2")
            
            sut.handleRatesLoaded([rawRate])
            
            let formattedPrice = sut.getRates().first?.buyPrice
            
            XCTAssertEqual(formattedPrice, "£13.20")
    }
    
    func testFormatRawPriceToEURPrice() throws {
            let rawRate = RawRate
                .stub()
                .setting(\.currencyCodeFrom, to: .eur)
                .setting(\.buy, to: "")
            
            sut.handleRatesLoaded([rawRate])
            
            let formattedPrice = sut.getRates().first?.buyPrice
            
            XCTAssertEqual(formattedPrice, "€0.00")
    }
}

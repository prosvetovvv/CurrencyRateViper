//
//  DetailDetailPresenterTests.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import XCTest

class DetailPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: DetailInteractorInput {

    }

    class MockRouter: DetailRouterInput {

    }

    class MockViewController: DetailViewInput {

        func setupInitialState() {

        }
    }
}

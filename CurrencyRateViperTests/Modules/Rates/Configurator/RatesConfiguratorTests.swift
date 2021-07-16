//
//  RatesRatesConfiguratorTests.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import XCTest

class RatesModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = RatesViewControllerMock()
        let configurator = RatesModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "RatesViewController is nil after configuration")
        XCTAssertTrue(viewController.output is RatesPresenter, "output is not RatesPresenter")

        let presenter: RatesPresenter = viewController.output as! RatesPresenter
        XCTAssertNotNil(presenter.view, "view in RatesPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in RatesPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is RatesRouter, "router is not RatesRouter")

        let interactor: RatesInteractor = presenter.interactor as! RatesInteractor
        XCTAssertNotNil(interactor.output, "output in RatesInteractor is nil after configuration")
    }

    class RatesViewControllerMock: RatesViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}

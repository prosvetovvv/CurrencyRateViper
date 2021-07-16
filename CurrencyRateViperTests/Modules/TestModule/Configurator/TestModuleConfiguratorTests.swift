//
//  TestModuleTestModuleConfiguratorTests.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 09/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import XCTest

class TestModuleModuleConfiguratorTests: XCTestCase {

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
        let viewController = TestModuleViewControllerMock()
        let configurator = TestModuleModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "TestModuleViewController is nil after configuration")
        XCTAssertTrue(viewController.output is TestModulePresenter, "output is not TestModulePresenter")

        let presenter: TestModulePresenter = viewController.output as! TestModulePresenter
        XCTAssertNotNil(presenter.view, "view in TestModulePresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in TestModulePresenter is nil after configuration")
        XCTAssertTrue(presenter.router is TestModuleRouter, "router is not TestModuleRouter")

        let interactor: TestModuleInteractor = presenter.interactor as! TestModuleInteractor
        XCTAssertNotNil(interactor.output, "output in TestModuleInteractor is nil after configuration")
    }

    class TestModuleViewControllerMock: TestModuleViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}

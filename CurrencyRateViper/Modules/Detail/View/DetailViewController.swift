//
//  DetailDetailViewController.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewInput {
    
    private let rootView: DetailView
    var output: DetailViewOutput!
    let configurator: DetailConfiguratorProtocol = DetailModuleConfigurator()
    
    // MARK: - Init
    
    init(with rate: Rate) {
        self.rootView = DetailView(with: rate)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(viewController: self)
        output.viewIsReady()
    }
    
    // MARK: - DetailViewInput
    
    func setupInitialState() {
        rootView.xButton.addTarget(self, action: #selector(tappedDismiss), for: .touchUpInside)
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedDismiss() {
        output.tappedXButton()
    }
}

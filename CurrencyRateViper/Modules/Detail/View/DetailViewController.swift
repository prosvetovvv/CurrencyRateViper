//
//  DetailDetailViewController.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 14/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let rootView: DetailView
    var output: DetailViewOutput!
    
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
        output.viewIsReady()
    }
    
    // MARK: - Objc
    
    @objc
    private func tappedDismiss() {
        output.tappedXButton()
    }
}

// MARK: - DetailViewInput

extension DetailViewController: DetailViewInput {
    func setupInitialState() {
        rootView.xButton.addTarget(self, action: #selector(tappedDismiss), for: .touchUpInside)
    }
}

// MARK: - DetailPresenterInput

extension DetailViewController: DetailPresenterInput {
    func present(from vc: UIViewController) {
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        vc.present(self, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

//
//  RatesRatesViewController.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class RatesViewController: UIViewController, RatesViewInput {
    
    private let rootView = RatesView()

    var output: RatesViewOutput!
    var presenter: RatesPresenter!
    let configurator: RatesConfiguratorProtocol = RatesModuleConfigurator()

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


    // MARK: - RatesViewInput
    
    func setupInitialState() {
        view.backgroundColor = .systemBackground
        
        rootView.tableView.register(RateCell.self, forCellReuseIdentifier: RateCell.reuseIdentifier)
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
    }
    
    func handleRatesChanged() {
        rootView.tableView.reloadData()
    }
    
    func showAlert(with error: CRError) {
        presentCRAlertOnMainThread(title: "Ошибка", message: error.rawValue, buttonTitle: "Ok", completionHandler: nil)
    }
    
    func startLoadingSpinner() {
        view.addSubview(spinnerView)
    }
    
    func stopLoadingSpinner() {
        dismissSpinnerView()
    }
}

//MARK: - Table view data source

extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.rates.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rate = output.rates[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: RateCell.reuseIdentifier, for: indexPath) as! RateCell

        cell.set(with: rate)

        return cell
    }
}

//MARK: - Table view data delegate

extension RatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rate = output.rates[safe: indexPath.row] else { return }
        
        output.tappedCell(with: rate)
    }
}



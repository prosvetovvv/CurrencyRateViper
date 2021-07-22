//
//  RatesRatesViewController.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12/07/2021.
//  Copyright © 2021 Vitaly. All rights reserved.
//

import UIKit

class RatesViewController: UIViewController {
    
    private let rootView = RatesView()
    
    var output: RatesViewOutput!
    var presenter: RatesPresenter!
    
    // MARK: - Init
    
//    init() {
//        //self.rootView = RatesView()
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
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
    private func handleRefreshControl() {
        output.draggedTable()
    }
}

// MARK: - RatesViewInput

extension RatesViewController: RatesViewInput {
    func setupInitialState() {
        view.backgroundColor = .systemBackground
        
        rootView.tableView.register(RateCell.self, forCellReuseIdentifier: RateCell.reuseIdentifier)
        rootView.tableView.dataSource = self
        rootView.tableView.delegate = self
        
        rootView.tableView.refreshControl = UIRefreshControl()
        rootView.tableView.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
        
        view.addSubview(spinnerView)
        
    }
    
    func handleRatesChanged() {
        rootView.tableView.reloadData()
        
        rootView.dateLabel.isHidden = false
        rootView.dateLabel.text = "Обновлено: \(output.getCurrentDate())"
        
        dismissSpinnerView()
        rootView.tableView.refreshControl?.endRefreshing()
    }
    
    func ratesLoadError(_ error: CRError) {
        dismissSpinnerView()
        rootView.tableView.refreshControl?.endRefreshing()
        presentCRAlertOnMainThread(title: "Ошибка", message: error.rawValue, buttonTitle: "Ok", completionHandler: nil)
    }
}

// MARK: - Table view data source

extension RatesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        output.getRatesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let rate = output.getRate(with: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RateCell.reuseIdentifier, for: indexPath) as? RateCell else { return UITableViewCell()}
        
        cell.set(with: rate)
        
        return cell
    }
}

// MARK: - Table view data delegate

extension RatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rate = output.getRate(with: indexPath.row) else { return }
        
        output.tappedCell(with: rate)
    }
}



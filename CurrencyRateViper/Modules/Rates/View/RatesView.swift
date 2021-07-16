//
//  RatesView.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12.07.2021.
//

import UIKit

class RatesView: UIView {
    let tableView = UITableView()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        setupSelf()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setupSelf() {
        tableView.rowHeight = 95
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        
        setNeedsUpdateConstraints()
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

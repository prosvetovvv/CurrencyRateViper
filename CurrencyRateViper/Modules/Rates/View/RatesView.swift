//
//  RatesView.swift
//  CurrencyRateViper
//
//  Created by Vitaly Prosvetov on 12.07.2021.
//

import UIKit

class RatesView: UIView {
    var dateLabel = CRSecondaryTitleLabel(textAlignment: .center, fontSize: 12.0)
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
        dateLabel.isHidden = true
        
        tableView.rowHeight = 95
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(dateLabel)
        addSubview(tableView)
        
        setNeedsUpdateConstraints()
    }
    
    // MARK: - Layout
    
    override func updateConstraints() {
        super.updateConstraints()
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

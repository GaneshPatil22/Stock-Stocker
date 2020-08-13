//
//  TrendingCell.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/13/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class TrendingCell: UITableViewCell {
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let companyTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()
    
    let ticketLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        lbl.alpha = 0.3
        return lbl
    }()
    
    let percentageLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        lbl.layer.masksToBounds = true
        lbl.layer.cornerRadius = 10
        lbl.font = lbl.font.withSize(12)
        lbl.textColor = .white
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    private func setUpView() {
        addSubview(logoImageView)
        addSubview(companyTitleLabel)
        addSubview(ticketLabel)
        addSubview(percentageLabel)
        
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        percentageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        percentageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        percentageLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        companyTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        companyTitleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10).isActive = true
        companyTitleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        companyTitleLabel.rightAnchor.constraint(equalTo: percentageLabel.leftAnchor, constant: -10).isActive = true
        
        ticketLabel.topAnchor.constraint(equalTo: companyTitleLabel.bottomAnchor).isActive = true
        ticketLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10).isActive = true
        ticketLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        ticketLabel.rightAnchor.constraint(equalTo: percentageLabel.leftAnchor, constant: -10).isActive = true
        
    }

    func setUpData(model: StockModel) {
        companyTitleLabel.text = model.companyName
        ticketLabel.text = model.ticker
        percentageLabel.text = fetchPercentage(price: model.price.toDouble() ?? 0.0, change: model.changes)
        percentageLabel.backgroundColor = model.changes < 0 ? .red : .green

        logoImageView.image = #imageLiteral(resourceName: "Stock")
        
    }

    private func fetchPercentage(price: Double, change: Double) -> String {
        let diff = price - change
        return (String(((change / diff) * 100).rounded(toPlaces: 2)) + "%")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

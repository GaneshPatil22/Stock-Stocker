//
//  TrendingView.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class TrendingViewCell: UICollectionViewCell {

    lazy var gainerAndSellerTV: UITableView = {
        let tv = UITableView()
        tv.isHidden = true
        tv.delegate = self
        tv.dataSource = self
        tv.tableFooterView = UIView()
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    var data: [String: [StockModel]] = [Constants.TopGainers.rawValue: [], Constants.TopSellers.rawValue: []]
    let keys = [Constants.TopGainers.rawValue, Constants.TopSellers.rawValue]

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(gainerAndSellerTV)

        gainerAndSellerTV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        gainerAndSellerTV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        gainerAndSellerTV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        gainerAndSellerTV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true

        gainerAndSellerTV.register(TrendingCell.self, forCellReuseIdentifier: CellIdentifier.TrendingCell.rawValue)
        getTopGainerStocks()
        
    }

    private func getTopGainerStocks() {
        NetworkHelper<GainerStockModel>.APICall(APIPath.GetTopGainers.description) { [weak self] result in
            switch result {
            case .failure(let err):
                AppUtil.showMessage("\(Messages.FailToFetchTopGainers.rawValue) \(err.localizedDescription)", messageTitle: Messages.Fail.rawValue , buttonTitle: Messages.Ok.rawValue)
            case .success(let model):
                self?.data[Constants.TopGainers.rawValue] = model.mostGainerStock
                self?.getTopSellerStocks()
            }
        }
    }

    private func getTopSellerStocks() {
        NetworkHelper<SellerStockModel>.APICall(APIPath.GetTopSellers.description) { [weak self] result in
            switch result {
            case .failure(let err):
                AppUtil.showMessage("\(Messages.FailToFetchTopSellers.rawValue) \(err.localizedDescription)", messageTitle: Messages.Fail.rawValue , buttonTitle: Messages.Ok.rawValue)
            case .success(let model):
                self?.data[Constants.TopSellers.rawValue] = model.mostLoserStock
                DispatchQueue.main.async {
                    self?.gainerAndSellerTV.isHidden = false
                    self?.gainerAndSellerTV.reloadData()
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TrendingViewCell: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data[keys[section]]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.TrendingCell.rawValue, for: indexPath) as! TrendingCell
        
        if let model = data[keys[indexPath.section]]?[indexPath.row] {
            cell.setUpData(model: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = .white
    }
}

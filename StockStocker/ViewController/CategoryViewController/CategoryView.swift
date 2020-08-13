//
//  CategoryView.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewCell: UICollectionViewCell {
        lazy var caegoryTV: UITableView = {
            let tv = UITableView()
            tv.delegate = self
            tv.dataSource = self
            tv.tableFooterView = UIView()
            tv.backgroundColor = .clear
            tv.translatesAutoresizingMaskIntoConstraints = false
            return tv
        }()

    var data: [CategoryModel] = AppUtil.getCategories()

        override init(frame: CGRect) {
            super.init(frame: .zero)
            addSubview(caegoryTV)

            caegoryTV.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            caegoryTV.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            caegoryTV.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
            caegoryTV.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true

            caegoryTV.register(CategoryCell.self, forCellReuseIdentifier: CellIdentifier.CategoryCell.rawValue)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    extension CategoryViewCell: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.CategoryCell.rawValue, for: indexPath) as! CategoryCell
            cell.setUpData(model: data[indexPath.row])
            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 130
        }
}

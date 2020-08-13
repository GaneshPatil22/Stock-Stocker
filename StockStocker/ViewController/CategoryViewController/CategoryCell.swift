//
//  CategoryCell.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/13/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    let holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 45
        return view
    }()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let categoryTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18.0)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    private func setUpView() {
        addSubview(holderView)
        holderView.addSubview(categoryTitleLabel)
        holderView.addSubview(logoImageView)
    
        holderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        holderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        holderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        holderView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true

        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 45).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        categoryTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        categoryTitleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10).isActive = true
        categoryTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        categoryTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        
    }
    
    func setUpData(model: CategoryModel) {
        categoryTitleLabel.text = model.name
        holderView.backgroundColor = model.color
        
        let image = model.image.withRenderingMode(.alwaysTemplate)
        logoImageView.image = image
        logoImageView.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

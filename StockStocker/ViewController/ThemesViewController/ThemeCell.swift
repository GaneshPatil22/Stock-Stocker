//
//  ThemeCell.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/13/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class ThemeCell: UICollectionViewCell {

    let holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9795556664, green: 0.9830386043, blue: 0.9865520597, alpha: 1)
        view.backgroundColor?.withAlphaComponent(0.2)
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.976159513, green: 0.9796443582, blue: 0.9831611514, alpha: 1)
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 5
        return view
    }()
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.numberOfLines = 2
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(holderView)
        holderView.addSubview(logoImageView)
        holderView.addSubview(label)

        holderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        holderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        holderView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        holderView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        logoImageView.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -10).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
    }
    
    func setUpData(model: ThemeModel) {
        label.text = model.name
        let image = model.image.withRenderingMode(.alwaysTemplate)
        logoImageView.image = image
        logoImageView.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

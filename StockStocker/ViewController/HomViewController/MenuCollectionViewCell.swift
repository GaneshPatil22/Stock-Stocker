//
//  MenuCollectionViewCell.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    let label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16.0)
        return lbl
    }()
    
    override var isHighlighted: Bool {
        didSet {
            label.textColor = isHighlighted ? .purple : .black
        }
    }
    
    override var isSelected: Bool {
           didSet {
               label.textColor = isSelected ? .purple : .black
           }
       }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)

        addSubview(label)

        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ThemeView.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import Foundation
import UIKit

class ThemeViewCell: UICollectionViewCell {

    lazy var themeCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let data = AppUtil.getTheme()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(themeCollectionView)
        
        themeCollectionView.backgroundColor = .clear
        themeCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        themeCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        themeCollectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        themeCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        themeCollectionView.register(ThemeCell.self, forCellWithReuseIdentifier: CellIdentifier.ThemeCell.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThemeViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.ThemeCell.rawValue, for: indexPath) as! ThemeCell
        cell.setUpData(model: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = frame.width / 2
        let height: CGFloat = 250
        return CGSize(width: width, height: height)
    }
}

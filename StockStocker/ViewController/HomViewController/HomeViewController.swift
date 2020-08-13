//
//  HomeViewController.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- UIElements
    var tabMenuCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var tabCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    //MARK: UIElements Constraint References
    var horizontalBarLeftConstraint: NSLayoutConstraint?
    
    //MARK: Variables
    var menu: [MenuItem] = AppUtil.getMenuItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Constants.Explore.rawValue
        
        setUpDelegates()
        registerCell()
        setUpBarButtonItems()
        setUpView()
        setUpHorizontalBar()
        
        initialSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .white
    }
    
    private func setUpDelegates() {
        tabMenuCollectionView.delegate = self
        tabMenuCollectionView.dataSource = self
        
        tabCollectionView.dataSource = self
        tabCollectionView.delegate = self
    }
    
    private func registerCell() {
        tabMenuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.MenuCollectionViewCell.rawValue)
        
        tabCollectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CellIdentifier.CategoryViewCell.rawValue)
        tabCollectionView.register(ThemeViewCell.self, forCellWithReuseIdentifier: CellIdentifier.ThemeViewCell.rawValue)
        tabCollectionView.register(TrendingViewCell.self, forCellWithReuseIdentifier: CellIdentifier.TrendingViewCell.rawValue)
    }
    
    private func setUpHorizontalBar() {
        let horizontalBar = UIView()
        horizontalBar.backgroundColor = .purple
        horizontalBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(horizontalBar)
        horizontalBarLeftConstraint = horizontalBar.leftAnchor.constraint(equalTo: tabMenuCollectionView.leftAnchor)
        horizontalBarLeftConstraint?.isActive = true
        horizontalBar.bottomAnchor.constraint(equalTo: tabMenuCollectionView.bottomAnchor).isActive = true
        horizontalBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        horizontalBar.widthAnchor.constraint(equalTo: (tabMenuCollectionView.widthAnchor), multiplier: 1 / 3).isActive = true
    }
    
    private func initialSelection() {
        tabMenuCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .left)
    }
    
    private func setUpBarButtonItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu"), style: .plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(menuActionTapped))
    }
    
    private func setUpView() {
        view.addSubview(tabMenuCollectionView)
        view.addSubview(tabCollectionView)
        
        tabMenuCollectionView.backgroundColor = .clear
        tabMenuCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tabMenuCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabMenuCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabMenuCollectionView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        tabCollectionView.backgroundColor = .clear
        tabCollectionView.topAnchor.constraint(equalTo: tabMenuCollectionView.bottomAnchor, constant: 10).isActive = true
        tabCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tabCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tabCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -55).isActive = true
    }
    
    @objc private func menuActionTapped() {
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabMenuCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.MenuCollectionViewCell.rawValue, for: indexPath) as! MenuCollectionViewCell
            cell.label.text = menu[indexPath.row].title
            return cell
        } else {
            if indexPath.item == 0 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.CategoryViewCell.rawValue, for: indexPath) as! CategoryViewCell
                return cell
            } else if indexPath.item == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.ThemeViewCell.rawValue, for: indexPath) as! ThemeViewCell
                return cell
            } else {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.TrendingViewCell.rawValue, for: indexPath) as! TrendingViewCell
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabMenuCollectionView {
            let menuItems = CGFloat(menu.count)
            let width: CGFloat = (collectionView.frame.width) / menuItems
            let size = CGSize(width: width, height: 35)
            return size
        } else {
            return CGSize(width: view.frame.width, height: collectionView.frame.height - 5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabMenuCollectionView {
            tabCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let menuItems = CGFloat(menu.count)
        horizontalBarLeftConstraint?.constant = scrollView.contentOffset.x / menuItems
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = IndexPath(item: Int(index), section: 0)
        tabMenuCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
}


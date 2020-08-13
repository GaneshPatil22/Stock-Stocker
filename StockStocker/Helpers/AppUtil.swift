//
//  AppUtil.swift
//  StockStocker
//
//  Created by MacMini 20 on 8/12/20.
//  Copyright © 2020 MacMini 20. All rights reserved.
//
import UIKit
class AppUtil {
    
    class func getMenuItems() -> [MenuItem] {
        var menuItems: [MenuItem] = []
        
        let categoryMenu = MenuItem(title: Constants.Category.rawValue, isSelected: true)
        let themeMenu = MenuItem(title: Constants.Themes.rawValue, isSelected: false)
        let trendingMenu = MenuItem(title: Constants.Trending.rawValue, isSelected: false)
        
        menuItems.append(categoryMenu)
        menuItems.append(themeMenu)
        menuItems.append(trendingMenu)
        
        return menuItems
    }
    
    class func getCategories() -> [CategoryModel] {
        var categories: [CategoryModel] = []
        
        let stock = CategoryModel(name: Constants.Stock.rawValue, image: #imageLiteral(resourceName: "Stock"), color: #colorLiteral(red: 0.6460804343, green: 0.6416094303, blue: 0.9937693477, alpha: 1))
        let etf = CategoryModel(name: Constants.ETFs.rawValue, image: #imageLiteral(resourceName: "ETFs"), color: #colorLiteral(red: 0.3042672873, green: 0.3084376156, blue: 0.8123453259, alpha: 1))
        let crypto = CategoryModel(name: Constants.Crypto.rawValue, image: #imageLiteral(resourceName: "Image"), color: #colorLiteral(red: 0.9972447753, green: 0.8422445059, blue: 0.2399392128, alpha: 1))
        
        categories.append(stock)
        categories.append(etf)
        categories.append(crypto)
        
        return categories
    }

    class func getTheme() -> [ThemeModel] {
        var themes: [ThemeModel] = []
        
        let first = ThemeModel(name: Constants.DI.rawValue, image: #imageLiteral(resourceName: "Stock"))
        let second = ThemeModel(name: Constants.BB.rawValue, image: #imageLiteral(resourceName: "ETFs"))
        let third = ThemeModel(name: Constants.CC.rawValue, image: #imageLiteral(resourceName: "Image"))
        let forth = ThemeModel(name: Constants.SRI.rawValue, image: #imageLiteral(resourceName: "Stock"))
        let fifth = ThemeModel(name: Constants.CG.rawValue, image: #imageLiteral(resourceName: "ETFs"))
        
        themes.append(first)
        themes.append(second)
        themes.append(third)
        themes.append(forth)
        themes.append(fifth)
        
        return themes
    }
    
    class func showMessage(_ messageText:String, messageTitle:String, buttonTitle:String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: messageTitle, message: messageText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            var topVC = UIApplication.shared.keyWindow?.rootViewController
            while((topVC!.presentedViewController) != nil){
                 topVC = topVC!.presentedViewController
            }
            topVC?.present(alert, animated: true, completion: nil)
        }
    }
    
}

//
//  TabBarController.swift
//  Drevmass
//
//  Created by Park Vladislav on 20.11.2023.
//

import UIKit
import SnapKit
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = UIColor(red: 0.19, green: 0.17, blue: 0.16, alpha: 1)
        let goodsVC = UINavigationController(rootViewController: GoodsViewController())
        let favoriteVC = UINavigationController(rootViewController: FavoriteViewController())
        let lessonsVC = UINavigationController(rootViewController: LessonsViewController())
        self.viewControllers = [goodsVC, lessonsVC, favoriteVC]
        UITabBarItem.appearance().setTitleTextAttributes([.font: UIFont(name: "Rubik-Regular", size: 14)!], for: .normal)

        goodsVC.tabBarItem = UITabBarItem(title: "Товары", image: UIImage(named: "goodsIcon"), selectedImage: UIImage(named: "goodsIcon"))
        lessonsVC.tabBarItem = UITabBarItem(title: "Уроки", image: UIImage(named: "lessonsIcon"), selectedImage: UIImage(named: "lessonsIcon"))
        favoriteVC.tabBarItem = UITabBarItem(title: "Избранное", image: UIImage(named: "favoriteIcon"), selectedImage: UIImage(named: "favoriteIconSelected"))
        tabBar.unselectedItemTintColor = .white
        tabBar.tintColor = .white
        tabBar.isTranslucent = false
    }
}



    





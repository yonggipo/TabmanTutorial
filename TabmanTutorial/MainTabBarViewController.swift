//
//  TabBarController.swift
//  TabmanTutorial
//
//  Created by 조기열 on 2023/05/03.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
}

extension MainTabBarViewController {
    
    func configureViewControllers() {
        let homeTabmanViewController = HomeTabmanViewController()
        let homeViewControllerName = String(describing: HomeViewController.self)
        let storyboard = UIStoryboard(name: homeViewControllerName, bundle: nil)
        guard let homeViewController = storyboard.instantiateViewController(withIdentifier: homeViewControllerName) as? HomeViewController else { return }
        homeTabmanViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        self.viewControllers = [homeTabmanViewController, homeViewController]
    }
}


//
//  HomeTabmanViewController.swift
//  TabmanTutorial
//
//  Created by 조기열 on 2023/05/03.
//

import UIKit
import Tabman
import Pageboy

class HomeTabmanViewController: TabmanViewController {
    
    // MARK: - Properties
    
    private var viewControllers: [UIViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureViewControllers()
        configureTabmanBar()
        dataSource = self
    }
}

extension HomeTabmanViewController {
    
    func configureViewControllers() {
        let num = [0, 1]
        viewControllers = num.map { ServiceViewController.serviceViewController(index: $0) }
    }
    
    func configureTabmanBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        bar.layout.contentInset = .init(top: 0, left: 12, bottom: 0, right: 0)
        addBar(bar, dataSource: self, at: .top)
    }
}

// MARK: - PageboyViewControllerDataSource, TMBarDataSource

extension HomeTabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "월정액")
        case 1:
            return TMBarItem(title: "자유이용")
        default:
            return TMBarItem(title: "")
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        nil
    }
}

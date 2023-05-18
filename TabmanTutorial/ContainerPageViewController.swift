//
//  ServicePageViewController.swift
//  TabmanTutorial
//
//  Created by 조기열 on 2023/05/03.
//

import UIKit

class ContainerPageViewController: UIPageViewController {
    
    // MARK: - Properties
    
    var pageVCs: [ServiceViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        configureViewControllers()
        
    }
}

extension ContainerPageViewController {
    
    func configureViewControllers() {
        let num = [0, 1]
        pageVCs = num.map { ServiceViewController.serviceViewController(index: $0) }
        
        setViewControllers([pageVCs[0]], direction: .forward, animated: true)
    }
    
    func changePage(set index: Int) {
        Swift.debugPrint(#fileID, #function, #line, "- set index: \(index)")
        setViewControllers([pageVCs[index]], direction: index == .zero ? .reverse : .forward, animated: true)
    }
}


// MARK: - UIPageViewControllerDelegate

extension ContainerPageViewController: UIPageViewControllerDelegate {
    
    
}

// MARK: - UIPageViewControllerDataSource

extension ContainerPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentPageIndex = pageVCs.firstIndex(of: viewController as! ServiceViewController) ?? 0
        if currentPageIndex == 0 {
            return nil // pageVCs[pageVCs.count - 1]
        }

        return pageVCs[currentPageIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentPageIndex = pageVCs.firstIndex(of: viewController as! ServiceViewController) ?? 0
        
        if currentPageIndex == pageVCs.count - 1 {
            return nil // pageVCs[0]
        }

        return pageVCs[currentPageIndex + 1]
    }
}

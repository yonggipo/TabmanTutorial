//
//  SecondTabBarVC.swift
//  TabmanTutorial
//
//  Created by 조기열 on 2023/05/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum DirectionType: Int {
        case month   = 0
        case free  = 1
    }
    
    // MARK: - Properties
    
    @IBOutlet weak var monthButton: UIButton!
    @IBOutlet weak var freeButton: UIButton!
    @IBOutlet weak var guideButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var currentChildViewController: ContainerPageViewController? {
        get {
            return children.first { $0 is ContainerPageViewController } as? ContainerPageViewController
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [monthButton, freeButton].forEach { $0.addTarget(self, action: #selector(handleButtonTapped), for: .touchUpInside) }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HomeViewController {
    
    @objc
    func handleButtonTapped(_ sender: UIButton) {
        let directionType = DirectionType(rawValue: sender.tag)
        directionType == .month ? currentChildViewController?.changePage(set: 0) : currentChildViewController?.changePage(set: 1)
    }
}

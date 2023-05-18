//
//  ServiceViewController.swift
//  TabmanTutorial
//
//  Created by 조기열 on 2023/05/03.
//

import Foundation
import UIKit

class ServiceViewController: UIViewController {
    
    // MARK: - Properties

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var index: Int? = nil
    
    // MARK: - View Life Cycle
    
    init?(coder: NSCoder, index: Int) {
        Swift.debugPrint(#fileID, #function, #line, "- index: \(index)")
        super.init(coder: coder)
        self.index = index
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        applyLayout(index: index)

        
        let cellNib = UINib(nibName: String(describing: ImageViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: ImageViewCell.reuseIdentifier)
        
        if let index = index {
            switch index {
            case 0:
                titleLabel.text = "월정액 서비스"
                descriptionLabel.text = "추가적인 세탁이 필요할 때 합리적인 가격으로 이용하세요"
            case 1:
                titleLabel.text = "자유이용 서비스"
                descriptionLabel.text = "편할 때 원하는 만큼 자유롭게 빨래 하세요"
            default:
                break
            }
        }
    }
}

extension ServiceViewController {
    
    func applyLayout(index: Int?) {
        let layout = UICollectionViewFlowLayout()
        let bounds = self.collectionView.bounds
        if index == 0 {
            layout.itemSize = CGSize(width: bounds.width, height: bounds.height / 3)
        } else if index == 1 {
            layout.itemSize = CGSize(width: bounds.width / 2, height: bounds.height)
            layout.scrollDirection = .horizontal
        }
        collectionView.collectionViewLayout = layout
    }
    
    class func serviceViewController(index: Int) -> ServiceViewController {
        Swift.debugPrint(#fileID, #function, #line, "- index: \(index)")
        let name = String(describing: ServiceViewController.self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let viewController = storyboard.instantiateInitialViewController { coder in
            ServiceViewController(coder: coder, index: index)
        }
        return viewController!
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension ServiceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch (section, self.index) {
        case (_, 0):
            return 3
        case (_, 1):
            return 3
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellID = String(describing: ImageViewCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ImageViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}


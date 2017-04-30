//
//  EmbeddedTableViewCell.swift
//  EmbeddedCollectionViewIssue
//
//  Created by Satinder Singh on 4/30/17.
//  Copyright © 2017 Satinder. All rights reserved.
//

import UIKit

class EmbeddedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    fileprivate let horizontalFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .horizontal         
        return flowLayout
    }()
    
    fileprivate let verticalFlowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    func setup(isHorizontal: Bool) {
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        if isHorizontal && flowLayout.scrollDirection != .horizontal {
            collectionView.setCollectionViewLayout(horizontalFlowLayout, animated: true)
        } else if !isHorizontal && flowLayout.scrollDirection != .vertical {
            collectionView.setCollectionViewLayout(verticalFlowLayout, animated: true)
        }
    }

}

extension EmbeddedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCollectionViewCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
}

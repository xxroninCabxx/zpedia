//
//  ItemsCollectionViewDataource.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/13/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

protocol ItemsCollectionViewDataSource: UICollectionViewDataSource {
    associatedtype T
    var items:[T] {get}
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(items: [T], collectionView: UICollectionView, delegate: UICollectionViewDelegate)
    
    func setupCollectionView()
    
}

extension ItemsCollectionViewDataSource {
    func setupCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
        
    }
}

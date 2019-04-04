//
//  UICollectionViewCell.swift
//  SortingAlgorithms
//
//  Created by Victor Magalhaes on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeue(_ reusableCell: String, for indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
    
    func swap(_ x0: Int, _ x1: Int, completion: @escaping (_ result: Bool) -> Void) {
        self.performBatchUpdates({ () -> Void in
            
            self.moveItem(
                at: IndexPath(item: x0, section: 0),
                to: IndexPath(item: x1, section: 0)
            )
            
            self.moveItem(
                at: IndexPath(item: x1, section: 0),
                to: IndexPath(item: x0, section: 0)
            )
            
        }, completion: { success in
            completion(success)
        })
    }
}

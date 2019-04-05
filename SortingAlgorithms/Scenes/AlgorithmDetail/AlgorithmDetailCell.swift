//
//  AlgorithmDetailCell.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

final class AlgorithmDetailCell: UICollectionViewCell {
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.minimumScaleFactor = 0.5
        label.contentScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupLabel()
    }
    
    private func setupCell() {
        layer.cornerRadius = 5
        backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.8)
    }
    
    private func setupLabel() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
    }
    
}

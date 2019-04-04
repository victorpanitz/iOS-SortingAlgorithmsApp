//
//  AlgorithmListViewCell.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

final class AlgorithmsListCell: UICollectionViewCell {
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool{
        didSet{
            backgroundColor = UIColor.white.withAlphaComponent(isSelected ? 0.1 : 0.2)
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCell()
        setupImageView()
        setupLabel()
    }
    
    private func setupCell() {
        layer.cornerRadius = 8
        backgroundColor = UIColor.white.withAlphaComponent(0.2)
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: frame.height*0.5),
            imageView.widthAnchor.constraint(equalToConstant: frame.height*0.5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
            ])
    }
    
    private func setupLabel() {
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20)
            ])
    }
    
}

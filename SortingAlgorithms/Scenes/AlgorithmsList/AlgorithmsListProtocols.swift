//
//  File.swift
//  SortingAlgorithms
//
//  Created by Victor Magalhaes on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

protocol AlgorithmsListView: AnyObject {
    func setNavigationBarTitle(_ text: String)
    func updateDataSource(dataSource: [Algorithm])
}

protocol AlgorithmsListRoutering: AnyObject {
    func navigateToAlgorithmDetail(algorithm: Algorithm)
}

//
//  AlgorithmDetailProtocol.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

protocol AlgorithmDetailView: AnyObject {
    func updateDataSource(_ datasource: [Int], reloadData: Bool)
    func swapCell(x0: Int, x1: Int)
    func setNavigationBarTitle(_ text: String)
    func allSwapsDidEnd()
}

protocol AlgorithmDetailRoutering: AnyObject {
    func dismiss()
}

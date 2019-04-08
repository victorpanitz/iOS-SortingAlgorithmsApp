//
//  AlgorithmInterface.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

protocol Algorithm: AnyObject {
    var title: String { get set }
    var description: String { get set }
    var image: String { get set }
    
    func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)]
    func swapDataSource( datasource: inout [Int], x0: Int, x1: Int)
}

extension Algorithm {
    func swapDataSource(datasource: inout [Int], x0: Int, x1: Int) {
        datasource.swapAt(x0, x1)
    }
}

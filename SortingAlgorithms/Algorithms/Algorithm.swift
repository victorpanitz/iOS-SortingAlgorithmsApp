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
        let val1 = datasource[x0]
        let val2 = datasource[x1]
        
        datasource.remove(at: x1)
        datasource.remove(at: x0)
        
        datasource.insert(val2, at: x0)
        datasource.insert(val1, at: x1)
    }
}

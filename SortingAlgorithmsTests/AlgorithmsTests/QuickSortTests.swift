//
//  QuickSortTests.swift
//  SortingAlgorithmsTests
//
//  Created by Joao Reichert on 02/06/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import XCTest
@testable import SortingAlgorithms

class QuickSortTests: XCTestCase {
    
    private let quickSort = QuickSort()
    
    func test_QuickSort_swap_data_source() {
        var dataSource = [1,3,2,5,4]
        
        quickSort.swapDataSource(datasource: &dataSource, x0: 1, x1: 2)
        
        XCTAssert(dataSource == [1,2,3,5,4])
    }
    
    func test_QuickSort_non_sorted() {
        let swaps: [(x0: Int, x1: Int)] = quickSort.generateSwaps(from: [1,3,2,5,4])
        
        XCTAssert(swaps.count == 2)
        XCTAssert((x0: 4, x1: 3) == swaps[0])
        XCTAssert((x0: 2, x1: 1) == swaps[1])
    }
    
    func test_QuickSort_already_sorted() {
        let swaps: [(x0: Int, x1: Int)] = quickSort.generateSwaps(from: [1,2,3,4,5])
        
        XCTAssert(swaps.count == 0)
    }
    
    func test_QuickSort_equal_values() {
        let swaps: [(x0: Int, x1: Int)] = quickSort.generateSwaps(from: [1,1,1,1,1])
        
        XCTAssert(swaps.count == 0)
    }
    
}



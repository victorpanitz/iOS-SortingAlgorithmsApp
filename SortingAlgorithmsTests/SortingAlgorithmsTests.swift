//
//  SortingAlgorithmsTests.swift
//  SortingAlgorithmsTests
//
//  Created by Victor on 02/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import XCTest
@testable import SortingAlgorithms

class SortingAlgorithmsTests: XCTestCase {

    private let bubbleSort = BubbleSort()
    private let insertionSort = InsertionSort()
    private let selectionSort = SelectionSort()

    func test_BubbleSort_non_sorted() {
        let swaps: [(x0: Int, x1: Int)] = bubbleSort.generateSwaps(from: [1,3,2,5,4])
        
        XCTAssert(swaps.count == 2)
        XCTAssert((x0: 1, x1: 2) == swaps[0])
        XCTAssert((x0: 3, x1: 4) == swaps[1])
    }
    
    func test_BubbleSort_already_sorted() {
        let swaps: [(x0: Int, x1: Int)] = bubbleSort.generateSwaps(from: [1,2,3,4,5])
        
        XCTAssert(swaps.count == 0)
    }
    
    func test_BubbleSort_equal_values() {
        let swaps: [(x0: Int, x1: Int)] = bubbleSort.generateSwaps(from: [1,1,1,1,1])

        XCTAssert(swaps.count == 0)
    }
    
    func test_InsertionSort_non_sorted() {
        let swaps: [(x0: Int, x1: Int)] = insertionSort.generateSwaps(from: [1,3,2,5,4])
        
        XCTAssert(swaps.count == 2)
        XCTAssert((x0: 2, x1: 1) == swaps[0])
        XCTAssert((x0: 4, x1: 3) == swaps[1])
    }
    
    func test_InsertionSort_already_sorted() {
        let swaps: [(x0: Int, x1: Int)] = insertionSort.generateSwaps(from: [1,2,3,4,5])
        
        XCTAssert(swaps.count == 0)
    }
    
    func test_InsertionSort_equal_values() {
        let swaps: [(x0: Int, x1: Int)] = insertionSort.generateSwaps(from: [1,1,1,1,1])
        
        XCTAssert(swaps.count == 0)
    }
    
    func test_SelectionSort_non_sorted() {
        let swaps: [(x0: Int, x1: Int)] = selectionSort.generateSwaps(from: [1,3,2,5,4])
        print(swaps)
        XCTAssert(swaps.count == 2)
        XCTAssert((x0: 1, x1: 2) == swaps[0])
        XCTAssert((x0: 3, x1: 4) == swaps[1])
    }
    
    func test_SelectionSort_already_sorted() {
        let swaps: [(x0: Int, x1: Int)] = selectionSort.generateSwaps(from: [1,2,3,4,5])
        
        XCTAssert(swaps.count == 0)
    }
    
    func test_SelectionSort_equal_values() {
        let swaps: [(x0: Int, x1: Int)] = selectionSort.generateSwaps(from: [1,1,1,1,1])
        print(swaps)
        
        XCTAssert(swaps.count == 0)
    }

}

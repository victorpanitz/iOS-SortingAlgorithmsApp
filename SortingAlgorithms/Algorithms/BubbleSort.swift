//
//  BubbleSort.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class BubbleSort: Algorithm {

    
    final var title: String = "Bubble Sort"
    final var image: String = "ic_bubble"
    final var description: String = "Bubble Sort Description"
    
    final func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)] {
        if list.count == 1 { return [] }
        
        var array = list
        var isSorting = true
        var swaps = [(x0: Int, x1: Int)]()
        
        while isSorting {
            isSorting = false
            
            for i in 0..<max(0, array.count - 1) {
                if array[i] > array[i+1] {
                    isSorting = true
                    swaps.append((x0: i, x1: i+1))
                    array.swapAt(i, i+1)
                }
            }
        }
        
        return swaps
    }
    
}

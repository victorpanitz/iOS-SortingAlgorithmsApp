//
//  InsertionSort.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class InsertionSort: Algorithm {
    
    final var title: String = "Insertion Sort"
    final var image: String = "ic_insertion"
    final var description: String = "Insertion Sort Description"
    
    final func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)] {
        if list.count == 1 { return [] }
        
        var array = list
        var swaps = [(x0: Int, x1: Int)]()
        
        for i in 1...max(1, array.count - 1) {
            var pos = i
            
            for j in (0...i-1).reversed() {
                if array[pos] < array[j] {
                    swaps.append((x0: j, x1: pos))
                    array.swapAt(j, pos)
                    pos = j
                }
            }
        }
        
        return swaps
    }

}

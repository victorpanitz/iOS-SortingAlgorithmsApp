//
//  SelectionSort.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class SelectionSort: Algorithm {
    
    final var title: String = "Selection Sort"
    final var image: String = "ic_selection"
    final var description: String = "Selection Sort Description"
    
    final func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)] {
        if list.count == 1 { return [] }

        var array = list
        var swaps = [(x0: Int, x1: Int)]()
        
        array.enumerated().forEach { (arg) in
            
            let (i, _) = arg
            
            var minValue = array[i]
            var minPos = i
            
            (i..<array.count).forEach {
                if array[$0] <= minValue {
                    minPos = $0
                    minValue = array[$0]
                }
            }

            if array[i] != array[minPos] {
                swaps.append((x0: i, x1: minPos))
                array.swapAt(i, minPos)
            }
        }

        return swaps
    }
    
}

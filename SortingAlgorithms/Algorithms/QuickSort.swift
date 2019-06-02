//
//  QuickSort.swift
//  SortingAlgorithms
//
//  Created by Joao Reichert on 31/05/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class QuickSort: Algorithm {
    
    final var title: String = "Quick Sort"
    final var image: String = "ic_quick_sorting"
    final var description: String = "Quick Sort Description"
    
    private var swaps = [(x0: Int, x1: Int)]()
    
    final func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)] {
        swaps.removeAll()
        guard list.count > 1 else { return [] }
        
        var copy = list;
        quicksort(array: &copy, left: 0, right: list.count - 1);
        
        return swaps
    }
}

extension QuickSort {

    private func swap(array: inout [Int], num1: Int, num2: Int) {
        array.swapAt(num1, num2)
        swaps.append((x0: num1, x1: num2))
    }

    private func quicksort ( array: inout [Int], left: Int, right: Int) {
        let pivot = right;
        var low = left;
        var high = right-1;

        if(right == low || high < low) {
            return
        }
        for _ in 0...array.count {
            if low <= high {
                if array[low] <= array[pivot] {
                    low = low + 1
                    continue
                }
                if array[high] > array[pivot] {
                    high = high - 1
                    continue
                }
                swap(array: &array, num1: low, num2: high);
                low = low + 1
                high = high - 1
            } else {
                if array[low] == array[pivot] {
                    break
                }
                swap(array: &array, num1: pivot, num2: low)
                break
            }
        }
        quicksort(array: &array, left: left, right: high)
        quicksort(array: &array, left: low + 1, right: right)

    }
}

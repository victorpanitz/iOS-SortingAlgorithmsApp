//
//  AlgorithmDetailPresenter.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class AlgorithmDetailPresenter {
    
    private weak var view: AlgorithmDetailView?
    private let algorithm: Algorithm
    private lazy var datasource = [Int]()
    private var swaps = [(x0: Int, x1: Int)]()
    
    init (algorithm: Algorithm, datasource: [Int]) {
        self.algorithm = algorithm
        self.datasource = datasource
    }
    
    func attachView(_ view: AlgorithmDetailView) {
        self.view = view
        
        view.setNavigationBarTitle(algorithm.title)
        view.updateDataSource(datasource)
        swaps = algorithm.generateSwaps(from: datasource)
    }
    
    func viewDidAppear() {
        algorithm.swapDataSource(datasource: &datasource, x0: swaps[0].x0, x1: swaps[0].x1)
        
        view?.setNavigationBarTitle(algorithm.title)
        view?.updateDataSource(datasource)
        view?.swapCell(x0: swaps[0].x0,x1: swaps[0].x1)
    }
    
    func swapDidComplete() {
        swaps.removeFirst()
        
        if swaps.count > 0 {
            algorithm.swapDataSource(datasource: &datasource, x0: swaps[0].x0, x1: swaps[0].x1)
            
            view?.updateDataSource(datasource)
            view?.swapCell(x0: swaps[0].x0, x1: swaps[0].x1)
        }
    }
}

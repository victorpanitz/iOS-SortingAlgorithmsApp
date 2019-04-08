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
    private let router: AlgorithmDetailRoutering
    
    init (router: AlgorithmDetailRoutering, algorithm: Algorithm, datasource: [Int]) {
        self.router = router
        self.algorithm = algorithm
        self.datasource = datasource
    }
    
    func attachView(_ view: AlgorithmDetailView) {
        self.view = view
        
        view.setNavigationBarTitle(algorithm.title)
        view.updateDataSource(datasource)
        swaps = algorithm.generateSwaps(from: datasource)
    }
    
    func startSwap() {
        
        if swaps.count > 0 {
            algorithm.swapDataSource(datasource: &datasource, x0: swaps[0].x0, x1: swaps[0].x1)
            view?.updateDataSource(datasource)
            view?.swapCell(x0: swaps[0].x0, x1: swaps[0].x1)
            swaps.removeFirst()
        }
    }
    
    func closeButtonTriggered() {
        router.dismiss()
    }
}

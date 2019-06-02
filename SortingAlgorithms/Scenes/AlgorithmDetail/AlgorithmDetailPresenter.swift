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
    private lazy var dataSource = [Int]()
    private(set) var dataSourceBackup = [Int]()
    private var swaps = [(x0: Int, x1: Int)]()
    private let router: AlgorithmDetailRoutering
    
    init (router: AlgorithmDetailRoutering, algorithm: Algorithm, datasource: [Int]) {
        self.router = router
        self.algorithm = algorithm
        self.dataSource = datasource
        self.dataSourceBackup = datasource
    }
    
    func attachView(_ view: AlgorithmDetailView) {
        self.view = view
        
        view.setNavigationBarTitle(algorithm.title)
        view.updateDataSource(dataSource)
        generateSwaps()
    }
    
    private func generateSwaps() {
        swaps = algorithm.generateSwaps(from: dataSource)
    }
    
    func viewDidAppear() {
        startSwap()
    }
    
    func swapDidComplete() {
        startSwap()
    }
    
    func restartButtonTriggered() {
        dataSource = dataSourceBackup
        view?.toggleRestartButton(false)
        view?.updateDataSourceAndReloadData(dataSource)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.generateSwaps()
            self.startSwap()
        }
    }
    
    private func startSwap() {
        guard swaps.count > 0 else {
            view?.toggleRestartButton(true)
            return
        }
        
        algorithm.swapDataSource(datasource: &dataSource, x0: swaps[0].x0, x1: swaps[0].x1)
        view?.updateDataSource(dataSource)
        view?.swapCell(x0: swaps[0].x0, x1: swaps[0].x1)
        swaps.removeFirst()
    }
    
    func closeButtonTriggered() {
        router.dismiss()
    }
}

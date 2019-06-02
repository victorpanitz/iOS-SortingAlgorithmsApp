//
//  AlgorithmsListPresenter.swift
//  SortingAlgorithms
//
//  Created by Victor Magalhaes on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

class AlgorithmsListPresenter {
    
    private weak var view: AlgorithmsListView?
    private let router: AlgorithmsListRoutering
    
    private let dataSource: [Algorithm] = [
        BubbleSort(),
        InsertionSort(),
        SelectionSort(),
        QuickSort()
    ]
    
    init (router: AlgorithmsListRoutering) {
        self.router = router
    }
    
    func attachView(_ view: AlgorithmsListView) {
        self.view = view
        
        view.updateDataSource(dataSource: dataSource)
    }
    
    func viewWillAppear() {
        view?.setNavigationBarTitle("Sorting Algorithms")
    }
    
    func itemTriggered(index: Int) {
        if (0..<dataSource.count).contains(index){
            router.navigateToAlgorithmDetail(algorithm: dataSource[index])
        }
        
        //TODO: handle 'false'
    }
    
}

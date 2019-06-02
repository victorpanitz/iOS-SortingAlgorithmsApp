//
//  DataSourcePresenter.swift
//  SortingAlgorithms
//
//  Created by Victor on 05/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

final class DataSourcePresenter {
    
    private weak var view: DataSourceView?
    private var array: [Int] = [Int]()
    private var newValue = String()
    private let router: DataSourceRoutering

    init(router: DataSourceRoutering) {
        self.router = router
    }
    
    func attachView(_ view: DataSourceView) {
        self.view = view
    }
    
    func viewDidAppear() {
        view?.setNavigationBarTitle("Array input")
    }
    
    func addButtonTriggered() {
        guard
            (0...40).contains(array.count + 1),
            newValue.count > 0,
            let value = Int(newValue)
            else { return }
        
        array.append(value)
        view?.clearInputField()
        newValue = ""
        view?.updateArray("\(array)")
        
    }
    
    func removeButtonTriggered() {
        if array.count > 0 {
            array.removeLast()
            view?.updateArray("\(array)")
        }
    }
    
    func inputDidChange(_ text: String) {
        newValue = text
    }
    
    func runTriggered() {
        if array.count > 0 {
            router.navigateToAlgorithmDetail(dataSource: array)
        }
    }
    
    func addSampleButtonTrigerred() {
        array = randomNumbers(10)
        view?.clearInputField()
        newValue = ""
        view?.updateArray("\(array)")
    }
    
    private func randomNumbers(_ total: Int) -> [Int] {
        return (0..<total).map { _ in .random(in: 1...40) }
    }
}

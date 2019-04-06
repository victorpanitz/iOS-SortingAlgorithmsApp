//
//  AlgorithmDetailRouter.swift
//  SortingAlgorithms
//
//  Created by Victor Magalhaes on 06/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class AlgorithmDetailRouter: AlgorithmDetailRoutering {
    
    private weak var view: UIViewController?
    private let algorithm: Algorithm
    private let dataSource: [Int]
    
    init(algorithm: Algorithm, datasource: [Int]) {
        self.algorithm = algorithm
        self.dataSource = datasource
    }
    
    func makeViewController() -> UIViewController {
        let presenter = AlgorithmDetailPresenter(router: self, algorithm: algorithm, datasource: dataSource)
        let viewController = AlgorithmDetailViewController(presenter: presenter)
        self.view = viewController
        
        return viewController
    }
    
    func dismiss() {
        view?.navigationController?.popToRootViewController(animated: true)
    }
}

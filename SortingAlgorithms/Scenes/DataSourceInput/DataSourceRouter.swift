//
//  DataSourceRouter.swift
//  SortingAlgorithms
//
//  Created by Victor on 05/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class DataSourceRouter: DataSourceRoutering {
    
    private weak var view: UIViewController?
    private let algorithm: Algorithm
    
    init(algorithm: Algorithm) {
        self.algorithm = algorithm
    }
    
    func makeViewController() -> UIViewController {
        let presenter = DataSourcePresenter(router: self)
        let viewController = DataSourceViewController(presenter: presenter)
        self.view = viewController
        
        return viewController
    }
    
    func navigateToAlgorithmDetail(dataSource: [Int]) {
        let router = AlgorithmDetailRouter(algorithm: algorithm, datasource: dataSource)
        
        view?.navigationController?.pushViewController(router.makeViewController(), animated: true)
    }
}

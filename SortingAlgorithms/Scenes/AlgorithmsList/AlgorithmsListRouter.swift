//
//  AlgorithmsListRouter.swift
//  SortingAlgorithms
//
//  Created by Victor Magalhaes on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class AlgorithmsListRouter: AlgorithmsListRoutering {
    
    private weak var view: UIViewController?
    
    init() {}
    
    func makeViewController() -> UIViewController {
        let presenter = AlgorithmsListPresenter(router: self)
        let viewController = AlgorithmsListViewController(presenter: presenter)
        self.view = viewController
        
        return viewController
    }
    
    func navigateToAlgorithmDetail(algorithm: Algorithm) {
        let presenter = AlgorithmDetailPresenter(algorithm: algorithm, datasource: [12,94,53,0,65,22,3,44,87,3,10,4])
        let viewController = AlgorithmDetailViewController(presenter: presenter)
        
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}

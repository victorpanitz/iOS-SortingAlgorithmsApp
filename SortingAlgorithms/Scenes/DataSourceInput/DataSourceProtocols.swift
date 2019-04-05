//
//  DataSourceProtocols.swift
//  SortingAlgorithms
//
//  Created by Victor on 05/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation

protocol DataSourceView: AnyObject {
    func clearInputField()
    func updateArray(_ text: String)
    func setNavigationBarTitle(_ text: String)
}

protocol DataSourceRoutering: AnyObject {
    func navigateToAlgorithmDetail(dataSource: [Int])
}

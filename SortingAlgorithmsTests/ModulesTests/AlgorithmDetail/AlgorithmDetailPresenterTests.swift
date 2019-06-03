//
//  AlgorithmDetailPresenterTests.swift
//  SortingAlgorithmsTests
//
//  Created by Victor on 08/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import XCTest
@testable import SortingAlgorithms

final class AlgorithmsDetailPresenterTests: XCTestCase {
    
    private var sut_presenter: AlgorithmDetailPresenter!
    private var view: AlgorithmDetailViewSpy!
    private var router: AlgorithmDetailRouteringSpy!
    private var algorithm: AlgorithmSpy!
    
    override func setUp() {
        view = AlgorithmDetailViewSpy()
        router = AlgorithmDetailRouteringSpy()
        algorithm = AlgorithmSpy()
        sut_presenter = AlgorithmDetailPresenter(router: router, algorithm: algorithm, datasource: [1,3,2,5,4])
        sut_presenter.attachView(view)
    }
    
    func test_attachView() {
        XCTAssertEqual(view.setNavigationBarTitleCalled, true)
        XCTAssertEqual(view.navigationBarTitlePassed, "algorithm title value")
        XCTAssertEqual(view.updateDataSourceCalled , true)
        XCTAssertEqual(view.reloadDataCalled, false)
        XCTAssertEqual(view.dataSourcePassed!.count, 5)
        XCTAssertEqual(view.dataSourcePassed![0], 1)
        XCTAssertEqual(view.dataSourcePassed![1], 3)
        XCTAssertEqual(view.dataSourcePassed![2], 2)
        XCTAssertEqual(view.dataSourcePassed![3], 5)
        XCTAssertEqual(view.dataSourcePassed![4], 4)
    }
    
    func test_viewDidAppear() {
        sut_presenter.viewDidAppear()
        
        XCTAssertEqual(view.updateDataSourceCalled, true)
        XCTAssertEqual(view.reloadDataCalled, false)
        XCTAssertEqual(view.dataSourcePassed!.count, 5)
        XCTAssertEqual(view.dataSourcePassed![0], 3)
        XCTAssertEqual(view.dataSourcePassed![1], 1)
        XCTAssertEqual(view.dataSourcePassed![2], 2)
        XCTAssertEqual(view.dataSourcePassed![3], 5)
        XCTAssertEqual(view.dataSourcePassed![4], 4)
        
        XCTAssertEqual(view.swapCellCalled, true)
        XCTAssertEqual(view.swaps.count, 1)
        XCTAssertEqual(view.swaps[0].x0, 0)
        XCTAssertEqual(view.swaps[0].x1, 1)
    }
    
    func test_swapDidComplete() {
        sut_presenter.viewDidAppear()
        sut_presenter.swapDidComplete()
        
        XCTAssertEqual(view.updateDataSourceCalled, true)
        XCTAssertEqual(view.reloadDataCalled, false)
        XCTAssertEqual(view.dataSourcePassed!.count, 5)
        XCTAssertEqual(view.dataSourcePassed![0], 3)
        XCTAssertEqual(view.dataSourcePassed![1], 1)
        XCTAssertEqual(view.dataSourcePassed![2], 5)
        XCTAssertEqual(view.dataSourcePassed![3], 2)
        XCTAssertEqual(view.dataSourcePassed![4], 4)
        
        XCTAssertEqual(view.swapCellCalled, true)
        XCTAssertEqual(view.swaps.count, 2)
        XCTAssertEqual(view.swaps[0].x0, 0)
        XCTAssertEqual(view.swaps[0].x1, 1)
        XCTAssertEqual(view.swaps[1].x0, 2)
        XCTAssertEqual(view.swaps[1].x1, 3)
    }
    
    func test_closeButtonTriggered() {
        sut_presenter.closeButtonTriggered()
        
        XCTAssertEqual(router.dismissCalled, true)
    }
    
    func test_restartButtonTriggered() {
        sut_presenter.restartButtonTriggered()
        
        XCTAssertEqual(view.restartButtonIsEnable, false)
        XCTAssertEqual(view.updateDataSourceCalled, true)
        XCTAssertEqual(view.reloadDataCalled, true)
        XCTAssertEqual(view.dataSourcePassed!.count, 5)
        XCTAssertEqual(view.dataSourcePassed![0], 1)
        XCTAssertEqual(view.dataSourcePassed![1], 3)
        XCTAssertEqual(view.dataSourcePassed![2], 2)
        XCTAssertEqual(view.dataSourcePassed![3], 5)
        XCTAssertEqual(view.dataSourcePassed![4], 4)
    }
    
}

final class AlgorithmDetailViewSpy: AlgorithmDetailView {
    
    var updateDataSourceCalled: Bool?
    var reloadDataCalled: Bool?
    var swapCellCalled: Bool?
    var toggleRestartButtonCalled: Bool?
    var restartButtonIsEnable: Bool?
    var setNavigationBarTitleCalled: Bool?
    var dataSourcePassed: [Int]?
    var swaps = [(x0: Int, x1: Int)]()
    var x0IndexPassed: Int?
    var x1IndexPassed: Int?
    var navigationBarTitlePassed: String?
    
    func updateDataSource(_ datasource: [Int]) {
        updateDataSourceCalled = true
        reloadDataCalled = false
        dataSourcePassed = datasource
    }
    
    func swapCell(x0: Int, x1: Int) {
        swapCellCalled = true
        swaps.append((x0: x0, x1: x1))
    }
    
    func setNavigationBarTitle(_ text: String) {
        setNavigationBarTitleCalled = true
        navigationBarTitlePassed = text
    }
    
    func updateDataSourceAndReloadData(_ datasource: [Int]) {
        updateDataSourceCalled = true
        reloadDataCalled = true
        dataSourcePassed = datasource
    }
    
    func toggleRestartButton(_ isEnable: Bool) {
        toggleRestartButtonCalled = true
        restartButtonIsEnable = isEnable
    }
    
}

final class AlgorithmDetailRouteringSpy: AlgorithmDetailRoutering {
    
    var dismissCalled: Bool?
    
    func dismiss() {
        dismissCalled = true
    }
    
}

final class AlgorithmSpy: Algorithm {
    var title: String = "algorithm title value"
    var description: String = "algorithm description value"
    var image: String = "algorithm image value"
    
    func generateSwaps(from list: [Int]) -> [(x0: Int, x1: Int)] {
        return [
            (x0: 0, x1: 1),
            (x0: 2, x1: 3),
            (x0: 4, x1: 5)
        ]
    }

}

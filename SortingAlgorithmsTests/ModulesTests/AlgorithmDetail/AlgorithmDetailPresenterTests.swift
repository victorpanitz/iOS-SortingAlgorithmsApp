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
    
    override func setUp() {
        view = AlgorithmDetailViewSpy()
        router = AlgorithmDetailRouteringSpy()
        sut_presenter = AlgorithmDetailPresenter(router: router, algorithm: BubbleSort(), datasource: [1,3,2,5,4])
        sut_presenter.attachView(view)
    }
    
    func test_attachView() {
        XCTAssert(view.setNavigationBarTitleCalled == true)
        XCTAssert(view.navigationBarTitlePassed == "Bubble Sort")
        XCTAssert(view.updateDataSourceCalled == true)
        XCTAssert(view.dataSourcePassed!.count == 5)
        XCTAssert(view.dataSourcePassed![0] == 1)
        XCTAssert(view.dataSourcePassed![1] == 3)
        XCTAssert(view.dataSourcePassed![2] == 2)
        XCTAssert(view.dataSourcePassed![3] == 5)
        XCTAssert(view.dataSourcePassed![4] == 4)
    }
    
    func test_viewDidAppear() {
        sut_presenter.viewDidAppear()
        
        XCTAssert(view.updateDataSourceCalled == true)
        XCTAssert(view.dataSourcePassed!.count == 5)
        XCTAssert(view.dataSourcePassed![0] == 1)
        XCTAssert(view.dataSourcePassed![1] == 2)
        XCTAssert(view.dataSourcePassed![2] == 3)
        XCTAssert(view.dataSourcePassed![3] == 5)
        XCTAssert(view.dataSourcePassed![4] == 4)
        
        XCTAssert(view.swapCellCalled == true)
        XCTAssert(view.swaps.count == 1)
        XCTAssert(view.swaps[0].x0 == 1)
        XCTAssert(view.swaps[0].x1 == 2)
    }
    
    func test_swapDidComplete() {
        sut_presenter.viewDidAppear()
        sut_presenter.swapDidComplete()
        
        XCTAssert(view.updateDataSourceCalled == true)
        XCTAssert(view.dataSourcePassed!.count == 5)
        XCTAssert(view.dataSourcePassed![0] == 1)
        XCTAssert(view.dataSourcePassed![1] == 2)
        XCTAssert(view.dataSourcePassed![2] == 3)
        XCTAssert(view.dataSourcePassed![3] == 4)
        XCTAssert(view.dataSourcePassed![4] == 5)
        
        XCTAssert(view.swapCellCalled == true)
        XCTAssert(view.swaps.count == 2)
        XCTAssert(view.swaps[0].x0 == 1)
        XCTAssert(view.swaps[0].x1 == 2)
        XCTAssert(view.swaps[1].x0 == 3)
        XCTAssert(view.swaps[1].x1 == 4)
    }
    
    func test_closeButtonTriggered() {
        sut_presenter.closeButtonTriggered()
        
        XCTAssert(router.dismissCalled == true)
    }
    
}

final class AlgorithmDetailViewSpy: AlgorithmDetailView {
    
    var updateDataSourceCalled: Bool?
    var swapCellCalled: Bool?
    var setNavigationBarTitleCalled: Bool?
    var dataSourcePassed: [Int]?
    var swaps = [(x0: Int, x1: Int)]()
    var x0IndexPassed: Int?
    var x1IndexPassed: Int?
    var navigationBarTitlePassed: String?
    
    func updateDataSource(_ datasource: [Int]) {
        updateDataSourceCalled = true
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
    
}

final class AlgorithmDetailRouteringSpy: AlgorithmDetailRoutering {
    
    var dismissCalled: Bool?
    
    func dismiss() {
        dismissCalled = true
    }
    
}

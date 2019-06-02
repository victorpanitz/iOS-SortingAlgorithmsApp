//
//  AlgorithmsListPresenterTests.swift
//  SortingAlgorithmsTests
//
//  Created by Victor Magalhaes on 07/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import XCTest
@testable import SortingAlgorithms

final class AlgorithmsListPresenterTests: XCTestCase {

    var sut_presenter: AlgorithmsListPresenter!
    var view: AlgorithmsListViewSpy!
    var router: AlgorithmsListRouteringSpy!
    
    override func setUp() {
        view = AlgorithmsListViewSpy()
        router = AlgorithmsListRouteringSpy()
        sut_presenter = AlgorithmsListPresenter(router: router)
        
        sut_presenter.attachView(view)
    }
    
    func test_attachView() {
        XCTAssert(view.updateDataSourceCalled == true)
        XCTAssert(view.dataSourcePassed!.count == 4)
        XCTAssert(view.dataSourcePassed![0] is BubbleSort)
        XCTAssert(view.dataSourcePassed![1] is InsertionSort)
        XCTAssert(view.dataSourcePassed![2] is SelectionSort)
        XCTAssert(view.dataSourcePassed![3] is QuickSort)
    }
    
    func test_viewWillAppear() {
        sut_presenter.viewWillAppear()
        
        XCTAssert(view.setNavigationBarTitleCalled == true)
        XCTAssert(view.navigationBarTitlePassed == "Sorting Algorithms")
    }
    
    func test_itemTriggered_bubbleSort() {
        sut_presenter.itemTriggered(index: 0)
        
        XCTAssert(router.navigateToAlgorithmDetailCalled == true)
        XCTAssert(router.algorithmPassed is BubbleSort)
    }

    func test_itemTriggered_insertionSort() {
        sut_presenter.itemTriggered(index: 1)
        
        XCTAssert(router.navigateToAlgorithmDetailCalled == true)
        XCTAssert(router.algorithmPassed is InsertionSort)
    }
    
    func test_itemTriggered_selectionSort() {
        sut_presenter.itemTriggered(index: 2)
        
        XCTAssert(router.navigateToAlgorithmDetailCalled == true)
        XCTAssert(router.algorithmPassed is SelectionSort)
    }
    
    func test_itemTriggered_quickSort() {
        sut_presenter.itemTriggered(index: 3)
        
        XCTAssert(router.navigateToAlgorithmDetailCalled == true)
        XCTAssert(router.algorithmPassed is QuickSort)
    }

    
    func test_itemTriggered_invalid_index() {
        sut_presenter.itemTriggered(index: 4)
        
        XCTAssert(router.navigateToAlgorithmDetailCalled == nil)
        XCTAssert(router.algorithmPassed == nil)
    }
    
}

final class AlgorithmsListViewSpy: AlgorithmsListView {
    
    var setNavigationBarTitleCalled: Bool?
    var navigationBarTitlePassed: String?
    var updateDataSourceCalled: Bool?
    var dataSourcePassed: [Algorithm]?
    
    func setNavigationBarTitle(_ text: String) {
        setNavigationBarTitleCalled = true
        navigationBarTitlePassed = text
    }
    
    func updateDataSource(dataSource: [Algorithm]) {
        updateDataSourceCalled = true
        dataSourcePassed = dataSource
    }
    
}

final class AlgorithmsListRouteringSpy: AlgorithmsListRoutering {
    var navigateToAlgorithmDetailCalled: Bool?
    var algorithmPassed: Algorithm?
    
    func navigateToAlgorithmDetail(algorithm: Algorithm) {
        navigateToAlgorithmDetailCalled = true
        algorithmPassed = algorithm
    }
    
}

//
//  AlgorithmDetailViewController.swift
//  SortingAlgorithms
//
//  Created by Victor on 03/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

final class AlgorithmDetailViewController: UIViewController {
    
    lazy var closeButton: UIBarButtonItem = {
        var rightButton = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem.stop,
            target: self,
            action: #selector(closeButtonDidTouchUpInside)
        )
        return rightButton
    }()
    
    lazy var restartButton: UIBarButtonItem = {
        let restartButton = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(restartButtonDidTouchUpInside))
        restartButton.isEnabled = false
        return restartButton
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(AlgorithmDetailCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor.clear
        collection.contentMode = .scaleAspectFill
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.contentInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
        
        return collection
    }()
    
    private var datasource = [Int]()
    
    private let presenter: AlgorithmDetailPresenter
    
    init(presenter: AlgorithmDetailPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupNavigationBar()
        setupCollectionView()
        
        presenter.attachView(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear()
        collectionView.reloadData()
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        self.navigationItem.rightBarButtonItems = [
            restartButton,
            closeButton
        ]
    }
    
    private func setupCollectionView() {setupNavigationBar()
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
    
    @objc private func closeButtonDidTouchUpInside() {
        presenter.closeButtonTriggered()
    }
    
    @objc private func restartButtonDidTouchUpInside() {
        presenter.restartButtonTriggered()
    }
}

extension AlgorithmDetailViewController: AlgorithmDetailView {
    
    func toggleRestartButton(_ isEnable: Bool) {
        restartButton.isEnabled = isEnable
    }
    
    func setNavigationBarTitle(_ text: String) {
        navigationItem.title = text
    }
    
    func updateDataSource(_ datasource: [Int]) {
        self.datasource = datasource
    }
    
    func updateDataSourceAndReloadData(_ datasource: [Int]) {
        self.datasource = datasource
        self.collectionView.reloadData()
    }
    
    func swapCell(x0: Int, x1: Int) {
        UIView.animate(withDuration: 0.8, animations: {
            self.collectionView.swap(x0, x1, completion: { [weak self] (_) in
                self?.presenter.swapDidComplete()
            })
        })
    }
    
}

extension AlgorithmDetailViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return datasource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell  = collectionView.dequeue("cell", for: indexPath) as? AlgorithmDetailCell
            else { return UICollectionViewCell() }
        
        cell.label.text = "\(datasource[indexPath.row])"
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width * 0.1 , height: self.view.frame.width * 0.1)
    }
    
}

extension AlgorithmDetailViewController: UICollectionViewDelegateFlowLayout {}

//
//  ViewController.swift
//  SortingAlgorithms
//
//  Created by Victor on 02/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import UIKit

final class AlgorithmsListViewController: UIViewController {

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(AlgorithmsListCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = UIColor.clear
        collection.contentMode = .scaleAspectFill
        collection.isUserInteractionEnabled = true
        collection.isScrollEnabled = true
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        return collection
    }()
    
    private var dataSource = [Algorithm]()
    private let presenter: AlgorithmsListPresenter
    
    init(presenter: AlgorithmsListPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupCollectionView()
        setupNavigationBar()
        
        presenter.attachView(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        presenter.viewWillAppear()
    }
    
    private func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.barStyle = UIBarStyle.black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
    }
}

extension AlgorithmsListViewController: AlgorithmsListView {
    func updateDataSource(dataSource: [Algorithm]) {
        self.dataSource = dataSource
        collectionView.reloadData()
    }
    
    func setNavigationBarTitle(_ text: String) {
        navigationItem.title = text
    }
}

extension AlgorithmsListViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        presenter.itemTriggered(index: indexPath.row)
    }
}

extension AlgorithmsListViewController: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell  = collectionView.dequeue("cell", for: indexPath) as? AlgorithmsListCell
            else { return UICollectionViewCell()}
        
        cell.imageView.image = UIImage(named: dataSource[indexPath.row].image)
        cell.label.text = dataSource[indexPath.row].title
        
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
        
         return CGSize(width: self.view.frame.width * 0.9 , height: self.view.frame.height * 0.08)
    }
    
}

extension AlgorithmsListViewController: UICollectionViewDelegateFlowLayout {}

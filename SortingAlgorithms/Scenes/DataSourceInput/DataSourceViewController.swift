//
//  AlgorithmInsertionViewController.swift
//  SortingAlgorithms
//
//  Created by Victor on 05/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

final class DataSourceViewController: UIViewController {
    
    private lazy var inputField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.textColor = .black
        textField.font = UIFont(name: "Avenir-Light", size: 40)
        textField.backgroundColor = .white
        textField.delegate = self
        textField.keyboardType = .numberPad
        textField.layer.shadowRadius = 10
        textField.layer.shadowOpacity = 0.5
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), for: .normal)
        button.setTitle("Add", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.3)
        
        return button
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.setTitleColor(#colorLiteral(red: 0.8459790349, green: 0.2873021364, blue: 0.2579272389, alpha: 1), for: .normal)
        button.setTitle("Remove", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.3)
        
        return button
    }()
    
    private let arrayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let addSampleButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 20)
        button.setTitleColor(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), for: .normal)
        button.setTitle("Sample Array", for: .normal)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.3)
        
        return button
    }()
    
    let presenter: DataSourcePresenter
    
    init(presenter: DataSourcePresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black

        setupNavigationBar()
        
        setupInputField()
        setupAddButton()
        setupRemoveButton()
        setupArrayLabel()
        setupAddSampleButton()
        
        presenter.attachView(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.viewDidAppear()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        let rightButton = UIBarButtonItem(title: "Run", style: .done, target: self, action: #selector(runTouchUpInside))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    private func setupInputField(){
        view.addSubview(inputField)
        
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            inputField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputField.widthAnchor.constraint(equalToConstant: view.frame.width*0.4),
            inputField.heightAnchor.constraint(equalToConstant: view.frame.width*0.3),
            ])
        
        inputField.becomeFirstResponder()
    }
    
    private func setupArrayLabel() {
        view.addSubview(arrayLabel)
        
        NSLayoutConstraint.activate([
            arrayLabel.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 12),
            arrayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            arrayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            arrayLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 14)
            ])
    }
    
    private func setupAddButton() {
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.3),
            addButton.leadingAnchor.constraint(equalTo: inputField.trailingAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            addButton.centerYAnchor.constraint(equalTo: inputField.centerYAnchor)
            ])
        
        addButton.addTarget(self, action: #selector(addButtonTouchUpInside), for: .touchUpInside)
    }
    
    private func setupRemoveButton() {
        view.addSubview(removeButton)
        
        NSLayoutConstraint.activate([
            removeButton.heightAnchor.constraint(equalToConstant: view.frame.width*0.3),
            removeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            removeButton.trailingAnchor.constraint(equalTo: inputField.leadingAnchor),
            removeButton.centerYAnchor.constraint(equalTo: inputField.centerYAnchor)
            ])
        
        removeButton.addTarget(self, action: #selector(removeButtonTouchUpInside), for: .touchUpInside)
    }
    
    private func setupAddSampleButton() {
        view.addSubview(addSampleButton)
        
        NSLayoutConstraint.activate([
            addSampleButton.topAnchor.constraint(equalTo: arrayLabel.bottomAnchor, constant: 20.0),
            addSampleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addSampleButton.widthAnchor.constraint(equalToConstant: 140.0),
            addSampleButton.heightAnchor.constraint(equalToConstant: 40.0)
            ])
        
        addSampleButton.addTarget(self, action: #selector(addSampleArrayTouchUpInside), for: .touchUpInside)
    }
    
    @objc private func runTouchUpInside() {
        presenter.runTriggered()
    }
    
    @objc private func addButtonTouchUpInside() {
        presenter.addButtonTriggered()
    }
    
    @objc private func removeButtonTouchUpInside() {
        presenter.removeButtonTriggered()
    }
    
    @objc private func addSampleArrayTouchUpInside() {
        presenter.addSampleButtonTrigerred()
    }

}

extension DataSourceViewController: DataSourceView {
    
    func clearInputField() {
        inputField.text = ""
    }
    
    func updateArray(_ text: String) {
        arrayLabel.text = text
    }
    
    func setNavigationBarTitle(_ text: String) {
        navigationItem.title = text
    }
}

extension DataSourceViewController: UITextFieldDelegate {
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        presenter.inputDidChange(textField.text ?? "")
        
        return true
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        
        guard ((textField.text ?? "") + string).count > 5 else {
            presenter.inputDidChange((textField.text ?? "") + string)
            return true
        }
        
        return false
    }
}

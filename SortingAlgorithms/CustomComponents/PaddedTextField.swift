//
//  PaddedTextField.swift
//  SortingAlgorithms
//
//  Created by Victor on 05/04/19.
//  Copyright © 2019 Victor. All rights reserved.
//

import Foundation
import UIKit

class PaddedTextField: UITextField {

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { return nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 20, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 20, height: bounds.height)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width - 20, height: bounds.height)
    }
    
}

//
//  UITextField+Extension.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 08.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

extension UITextField {
    class func createTextFielf(withName name: String) -> UITextField {
        let textField: UITextField = {
            let textField = UITextField()
            textField.placeholder = name
            textField.borderStyle = .roundedRect
            textField.layer.masksToBounds = true
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
        return textField
    }
}


//
//  UIView+Extension.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 12.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

extension UIView {
    class func createViewForTextView() -> UIView {
        let view: UIView = {
            let view = UIView()
            view.layer.borderColor = UIColor.red.cgColor
            view.layer.borderWidth = 1.5
            view.layer.borderColor = UIColor.lightGray.cgColor
            view.clipsToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        return view
    }
}

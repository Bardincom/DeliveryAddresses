//
//  SeparatorView.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 08.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class SeparatorView: UIView {
    let customBackgroundView: UIView = {
        let view = UIView()
        view.frame = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Icon.pencil
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(customBackgroundView)
        customBackgroundView.addSubview(imageView)
        customBackgroundView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: -16.0),
            imageView.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor),
            
            separatorView.bottomAnchor.constraint(equalTo: customBackgroundView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.leadingAnchor.constraint(equalTo: customBackgroundView
                .leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: customBackgroundView.trailingAnchor, constant: 0),
            customBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            customBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

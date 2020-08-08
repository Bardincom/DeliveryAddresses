//
//  AdressTableViewHeaderView.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 07.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class AdressTableViewHeaderView: UITableViewHeaderFooterView {
    
    let separatorView: SeparatorView = {
        let view = SeparatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: contentView.topAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}


//
//  AdressTableViewHeaderView.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 07.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class AdressTableViewHeaderView: UITableViewHeaderFooterView {

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

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        contentView.addSubview(customBackgroundView)
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
            
            customBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            customBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            customBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            customBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ])
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


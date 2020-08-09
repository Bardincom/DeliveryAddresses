//
//  AddressTableViewCell.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 07.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet private var countryLabel: UILabel!
    @IBOutlet private var indexLabel: UILabel!
    @IBOutlet private var cityLabel: UILabel!
    @IBOutlet private var addressLabel: UILabel!

    func setupAddress(_ address: Address) {
        countryLabel.text = "\(address.country),"
        indexLabel.text = "\(address.index),"
        cityLabel.text = "г. \(address.city),"
        addressLabel.text = address.address
    }    
}

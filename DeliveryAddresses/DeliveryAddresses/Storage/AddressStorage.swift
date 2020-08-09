//
//  AddressStorage.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 09.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import Foundation

final class AddressStorage {

    func getAddress() -> [Address] {
        return [
            Address(country: "Poccия", index: 45000, city: "Mocква", address: "ул. Маяковского, 16"),
         Address(country: "Украина", index: 02217, city: "Киев", address: "ул. Бальзака, 34")
        ]
    }
}

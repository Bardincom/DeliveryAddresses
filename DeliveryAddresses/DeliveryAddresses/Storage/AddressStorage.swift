//
//  AddressStorage.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 09.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import Foundation

final class AddressStorage {
    static let shared = AddressStorage()

    private init() {}

    // data on the server
    private var addresses: [Address] = [
        Address(country: "Poccия", index: "45000", city: "Mocква", address: "ул. Маяковского, 16"),
        Address(country: "Украина", index: "02217", city: "Киев", address: "ул. Бальзака, 34")
    ]

    func getAddress() -> [Address] {
        return addresses
    }

    func postAddress(_ address: Address) {
        addresses.append(address)
    }

    func putAddress(_ selectAddress: Address, newAddress: Address) {

        if let index = addresses.firstIndex(where: { address -> Bool in
            if selectAddress.address == address.address
                || selectAddress.address == address.address
                || selectAddress.country == address.country
                || selectAddress.city == address.city
                || selectAddress.index == address.index {
                return true
            }
            return false
        }) {
            addresses[index] = newAddress
        }
    }
}

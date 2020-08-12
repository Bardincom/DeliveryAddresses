//
//  Constants.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 08.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

let withConfiguration = UIImage.SymbolConfiguration(weight: .medium)

enum Icon {
    static let pencil = UIImage(systemName: "pencil", withConfiguration: withConfiguration)
    static let plus = UIImage(systemName: "plus.circle", withConfiguration: withConfiguration)
    static let backButton = UIImage(systemName: "chevron.left", withConfiguration: withConfiguration)
}

enum Color {
    static let yellow = UIColor(named: "yellowColor")
}

enum Name {
    static let country = "Страна"
    static let index = "Индекс"
    static let city = "Город"
    static let address = "Адрес"
    static let buttonSave = "Сохранить изменения"
    static let heading = "РЕДАКТИРОВАНИЕ АДРЕСА "
    static let tableHader = "АДРЕС ДОСТАВКИ "
    static let deliveryAddresses = "Адреса доставки"
    static let deliveryAddress = "Адрес доставки"
}


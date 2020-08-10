//
//  EditingAddressViewController.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 08.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

protocol EditingAddressDelegate: class {
    func shouldReplace(address: Address, withAddress newAddress: Address)
    func shouldAdd(address: Address)
}

class EditingAddressViewController: UIViewController {

    weak var delegate: EditingAddressDelegate!
    var selectedAddress: Address?

    private let separatorView: SeparatorView = {
        let view = SeparatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.imageView.tintColor = Color.yellow
        return view
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        label.text = Name.heading
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.sizeToFit()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var countryTextField: UITextField = {
        let textField = UITextField.createTextFielf(withName: Name.country)
        return textField
    }()

    private var indexTextField: UITextField = {
        let textField = UITextField.createTextFielf(withName: Name.index)
        return textField
    }()

    private var cityTextField: UITextField = {
        let textField = UITextField.createTextFielf(withName: Name.city)
        return textField
    }()

    private var addressTextField: UITextField = {
        let textField = UITextField.createTextFielf(withName: Name.address)
        return textField
    }()

    private let saveBotton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(saveAddress), for: .touchUpInside)
        button.setTitle(Name.buttonSave, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = Color.yellow?.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayuot()
        setupAddress()
    }

}

private extension EditingAddressViewController {
    func setupLayuot() {
        view.addSubview(separatorView)
        view.addSubview(stackView)
        view.addSubview(saveBotton)
        separatorView.customBackgroundView.addSubview(label)
        stackView.addArrangedSubview(countryTextField)
        stackView.addArrangedSubview(indexTextField)
        stackView.addArrangedSubview(cityTextField)
        stackView.addArrangedSubview(addressTextField)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: separatorView.customBackgroundView.leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: separatorView.customBackgroundView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),

            stackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            countryTextField.heightAnchor.constraint(equalToConstant: 54),
            indexTextField.heightAnchor.constraint(equalToConstant: 54),
            cityTextField.heightAnchor.constraint(equalToConstant: 54),
            addressTextField.heightAnchor.constraint(equalToConstant: 54),

            saveBotton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 34),
            saveBotton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            saveBotton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            saveBotton.heightAnchor.constraint(equalToConstant: 54)

        ])
    }

    func setupAddress() {
        guard let selectedAddress = selectedAddress else { return }
        countryTextField.text = selectedAddress.country
        indexTextField.text = selectedAddress.index
        cityTextField.text = selectedAddress.city
        addressTextField.text = selectedAddress.address
    }
}

private extension EditingAddressViewController {


    @objc
    func saveAddress() {
        guard
            let country = countryTextField.text,
            let index = indexTextField.text,
            let city = cityTextField.text,
            let address = addressTextField.text else { return }

        let newAddress = Address(country: country, index: index, city: city, address: address)

        guard let delegate = delegate else { return }

        guard selectedAddress == nil else {
            guard let selectedAddress = selectedAddress else { return }
            delegate.shouldReplace(address: selectedAddress, withAddress: newAddress)

            navigationController?.popViewController(animated: true)
            return
        }

        delegate.shouldAdd(address: newAddress)

        navigationController?.popViewController(animated: true)
    }
}

//
//  EditingAddressViewController.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 08.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

/// Informs the subscribing class to add or rewrite an Address in the address store
protocol EditingAddressDelegate: class {
    func shouldReplace(address: Address, withAddress newAddress: Address)
    func shouldAdd(address: Address)
}

class EditingAddressViewController: UIViewController {

    weak var delegate: EditingAddressDelegate?
    var selectedAddress: Address?
    var section: String?

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
        let textField = UITextField.createTextField(withName: Name.country)
        return textField
    }()

    private var indexTextField: UITextField = {
        let textField = UITextField.createTextField(withName: Name.index)
        return textField
    }()

    private var cityTextField: UITextField = {
        let textField = UITextField.createTextField(withName: Name.city)
        return textField
    }()

    private var addressTextField: UITextField = {
        let textField = UITextField.createTextField(withName: Name.address)
        return textField
    }()

    private var countryView: UIView = {
        let view = UIView.createViewForTextView()
        return view
    }()

    private var indexView: UIView = {
        let view = UIView.createViewForTextView()
        return view
    }()

    private var cityView: UIView = {
        let view = UIView.createViewForTextView()
        return view
    }()

    private var addressView: UIView = {
        let view = UIView.createViewForTextView()
        return view
    }()

    private let saveBotton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(saveAddress), for: .touchUpInside)
        button.setTitle(Name.buttonSave, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = Color.yellow?.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayuot()
        setupAddress()
        setupNavigationBar()
    }
}

private extension EditingAddressViewController {
    func setupLayuot() {
        view.addSubview(separatorView)
        view.addSubview(stackView)
        view.addSubview(saveBotton)

        separatorView.customBackgroundView.addSubview(label)

        countryView.addSubview(countryTextField)
        indexView.addSubview(indexTextField)
        cityView.addSubview(cityTextField)
        addressView.addSubview(addressTextField)

        stackView.addArrangedSubview(countryView)
        stackView.addArrangedSubview(indexView)
        stackView.addArrangedSubview(cityView)
        stackView.addArrangedSubview(addressView)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: separatorView.customBackgroundView.leadingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: separatorView.customBackgroundView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            separatorView.topAnchor.constraint(equalTo: view.topAnchor, constant: 123),

            stackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            countryTextField.heightAnchor.constraint(equalToConstant: 54),
            indexTextField.heightAnchor.constraint(equalToConstant: 54),
            cityTextField.heightAnchor.constraint(equalToConstant: 54),
            addressTextField.heightAnchor.constraint(equalToConstant: 54),

            countryTextField.leadingAnchor.constraint(equalTo: countryView.leadingAnchor, constant: 16),
            indexTextField.leadingAnchor.constraint(equalTo: indexView.leadingAnchor, constant: 16),
            cityTextField.leadingAnchor.constraint(equalTo: cityView.leadingAnchor, constant: 16),
            addressTextField.leadingAnchor.constraint(equalTo: addressView.leadingAnchor, constant: 16),

            countryTextField.trailingAnchor.constraint(equalTo: countryView.trailingAnchor),
            indexTextField.trailingAnchor.constraint(equalTo: indexView.trailingAnchor),
            cityTextField.trailingAnchor.constraint(equalTo: cityView.trailingAnchor),
            addressTextField.trailingAnchor.constraint(equalTo: addressView.trailingAnchor),

            countryView.heightAnchor.constraint(equalToConstant: 54),
            indexView.heightAnchor.constraint(equalToConstant: 54),
            cityView.heightAnchor.constraint(equalToConstant: 54),
            addressView.heightAnchor.constraint(equalToConstant: 54),

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

    func setupNavigationBar() {
        title = Name.deliveryAddress
        label.text = "\(Name.heading)\(section ?? "")"
        let backButton = UIBarButtonItem(image: Icon.backButton, style: .plain, target: self, action: #selector(popViewController))
        backButton.tintColor = Color.yellow
        navigationItem.leftBarButtonItem = .some(backButton)
    }

    @objc
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }

    @objc
    func saveAddress() {
        guard
            let country = countryTextField.text, !country.isEmpty,
            let index = indexTextField.text, !index.isEmpty,
            let city = cityTextField.text, !city.isEmpty,
            let address = addressTextField.text, !address.isEmpty else {
            alert()
            return }

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

    func alert() {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Заполните все поля",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

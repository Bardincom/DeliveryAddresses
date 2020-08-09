//
//  AddressViewController.swift
//  DeliveryAddresses
//
//  Created by Aleksey Bardin on 07.08.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet private var addressTableView: UITableView! {
        willSet {
            newValue.register(nibCell: AddressTableViewCell.self)
            newValue.register(class: AddressTableViewHeaderView.self)
        }
    }

    var addresses = [Address]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        addresses = AddressStorage().getAddress()
        addressTableView.backgroundColor = .white
    }

}

extension AddressViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }

    func numberOfSections(in tableView: UITableView) -> Int {
        addresses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(reusable: AddressTableViewCell.self, for: indexPath)
        let address = addresses[indexPath.section]
        cell.setupAddress(address)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {        return Name.tableHader + "\(section + 1)"
    }

}

extension AddressViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Color.yellow
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = addressTableView.dequeue(reusable: AddressTableViewHeaderView.self)
        return header
    }
}

extension AddressViewController {
    func setupNavigationBar() {
        let button = UIBarButtonItem(image: Icon.plus,
                                     style: .plain,
                                     target: self,
                                     action: #selector(addAddress))
        button.tintColor = Color.yellow
        navigationItem.rightBarButtonItems = .some([button])
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    @objc
    func addAddress() {
        let editingAddressViewController = EditingAddressViewController()
        navigationController?.pushViewController(editingAddressViewController, animated: true)
    }

}

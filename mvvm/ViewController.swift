//
//  ViewController.swift
//  mvvm
//
//  Created by Waldi Febrianda on 02/08/23.
//

import UIKit

// ViewController.swift


class ViewController: UIViewController {
    private var viewModel = ItemViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add Item", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        print("hello waldi")
    }

    private func setupUI() {
        view.addSubview(tableView)
        view.addSubview(addButton)

        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height - 50)
        addButton.frame = CGRect(x: 0, y: view.bounds.height - 50, width: view.bounds.width, height: 50)
        print("hello waldi")
    }

    @objc private func addButtonTapped() {
        let alert = UIAlertController(title: "Add Item", message: "Enter the item name:", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Item Name"
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let itemName = alert.textFields?.first?.text {
                self?.viewModel.addItem(name: itemName)
                self?.tableView.reloadData()
            }
        })
        present(alert, animated: true, completion: nil)
        print("hello waldi")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = viewModel.getItem(at: indexPath.row).name
        return cell
    }
}

//
//  ViewController.swift
//  Swift-Sample-UICollectionViewController-UIViewController-in-Cell
//
//  Created by A10 Lab Inc. 003 on 2018/08/18.
//  Copyright © 2018年 A10 Lab Inc. 003. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let identifier = "cell"

    private let item: DataItem

    private let isPresented: Bool

    let presentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("modal", for: UIControlState())
        button.setTitleColor(.blue, for: UIControlState())
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        return button
    }()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.sectionFooterHeight = .leastNormalMagnitude
        tableView.sectionHeaderHeight = .leastNormalMagnitude
        tableView.rowHeight = 100
        tableView.clipsToBounds = true
        return tableView
    }()

    init(item: DataItem, isPresented: Bool = false) {
        self.item = item
        self.isPresented = isPresented
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        if isPresented {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(self.onCloseTapped))
        }

        presentButton.addTarget(self, action: #selector(self.onPresentTapped), for: .touchUpInside)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        tableView.dataSource = self

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])

        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            presentButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.widthAnchor.constraint(equalToConstant: 100),
            presentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc func onPresentTapped(_ sender: UIButton) {
        let vc = ViewController(item: item, isPresented: true)
        let nvc = UINavigationController(rootViewController: vc)
        present(nvc, animated: true, completion: nil)
    }

    @objc func onCloseTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.contents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = item.contents[indexPath.row]
        cell.backgroundColor = item.color
        return cell
    }
}

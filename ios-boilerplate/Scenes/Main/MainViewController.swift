//
//  MainViewController.swift
//  ios-boilerplate
//
//  Created by Firat Yenidunya on 15.05.2020.
//  Copyright © 2020 adesso Turkey. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel: MainViewModelProtocol!
    private var tableViewAdapter: MainTableViewAdapterProtocol!
    private let tableViewDataSource = MainTableViewDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = MainViewModel(delegate: self)
        tableViewAdapter = MainTableViewAdapter(tableView: tableView, dataSource: tableViewDataSource, delegate: self)

        setupViewModel()
    }

    func setupViewModel() {
        viewModel.setupDataSource()
    }
}

extension MainViewController: MainViewModelDelegate {

    func updateDataSource(_ dataSource: MainTableViewDataSource) {
        tableViewAdapter.setDataSource(dataSource)
    }
}

extension MainViewController: MainTableViewAdapterDelegate {

    func didSelectItem(at indexPath: IndexPath) {
    }
}

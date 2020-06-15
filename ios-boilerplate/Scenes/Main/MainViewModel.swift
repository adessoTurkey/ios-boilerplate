//
//  MainViewModel.swift
//  ios-boilerplate
//
//  Created by Emre Çetiner on 15.06.2020.
//  Copyright © 2020 adesso Turkey. All rights reserved.
//

import Foundation

protocol MainViewModelDelegate: class {

    /**
     Replaces data source with the given data source.
    
     - Parameters:
        - dataSource: New data source for the table view
    */
    func updateDataSource(_ dataSource: MainTableViewDataSource)
}

protocol MainViewModelProtocol: class {

    /**
     Initializes data source for the table view.
    */
    func setupDataSource()
}

class MainViewModel: MainViewModelProtocol {

    private enum ListItems: String, CaseIterable {
        case tableView = "TableView"
    }

    weak var delegate: MainViewModelDelegate?

    init(delegate: MainViewModelDelegate) {
        self.delegate = delegate
    }

    func setupDataSource() {
        var dataSource = MainTableViewDataSource()
        var section = MainTableViewSection()

        for listItem in ListItems.allCases {
            let item = MainTableViewItem(title: listItem.rawValue)
            section.items.append(item)
        }

        dataSource.sections.append(section)
        delegate?.updateDataSource(dataSource)
    }
}

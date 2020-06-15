//
//  MainTableViewAdapter.swift
//  ios-boilerplate
//
//  Created by Emre Çetiner on 15.06.2020.
//  Copyright © 2020 adesso Turkey. All rights reserved.
//

import UIKit

protocol MainTableViewAdapterProtocol: class {

    /**
     Sets table view data source.
    
     - Parameters:
        - dataSource: Data source for table view
    */
    func setDataSource(_ dataSource: MainTableViewDataSource)
    
    /**
     Returns table view item for the given index path.
    
     - Parameters:
        - at: Index path of the item
     - Returns: Table view item for given index path
    */
    func item(at indexPath: IndexPath) -> MainTableViewItem?
    
    /**
     Adds section to table view data source.
    
     - Parameters:
        - section: Section to be added to the data source
    */
    func add(section: MainTableViewSection)
    
    /**
     Adds array of sections to table view data source.
    
     - Parameters:
        - sections: Section array to be added
    */
    func add(sections: [MainTableViewSection])
    
    /**
     Removes item at the given index path.
    
     - Parameters:
        - at: Index path of the item to be removed
     - Returns: Removed item if index path is existing. Nil otherwise.
    */
    func removeItem(at indexPath: IndexPath) -> MainTableViewItem?
    
    /**
     Removes section at the given index.
    
     - Parameters:
        - atIndex: Index  of the section to be removed
     - Returns: Removed section if index is existing. Nil otherwise.
    */
    func removeSection(atIndex index: Int) -> MainTableViewSection?
    
    /**
     Removes all data from the table view data source.
    */
    func removeData()

    /**
     Reloads table view.
    */
    func reloadData()
}

protocol MainTableViewAdapterDelegate: class {

    /**
     Indicates that the item at the given index path is selected.
    
     - Parameters:
        - at: Index path of the selected item.
    */
    func selectedItem(at indexPath: IndexPath)
}

class MainTableViewAdapter: NSObject, MainTableViewAdapterProtocol {

    private weak var tableView: UITableView!
    weak var delegate: MainTableViewAdapterDelegate?

    var dataSource: MainTableViewDataSource {
        didSet {
            reloadData()
        }
    }

    init(tableView: UITableView, dataSource: MainTableViewDataSource, delegate: MainTableViewAdapterDelegate?) {
        self.tableView = tableView
        self.dataSource = dataSource
        self.delegate = delegate

        super.init()

        tableView.delegate = self
        tableView.dataSource = self
    }

    func setDataSource(_ dataSource: MainTableViewDataSource) {
        self.dataSource = dataSource
    }

    func item(at indexPath: IndexPath) -> MainTableViewItem? {
        let section = indexPath.section
        let row = indexPath.row
        let sections = dataSource.sections
        guard section < sections.count, row < sections[section].items.count else { return nil }

        return sections[section].items[row]
    }

    func add(section: MainTableViewSection) {
        dataSource.sections.append(section)
    }

    func add(sections: [MainTableViewSection]) {
        dataSource.sections.append(contentsOf: sections)
    }

    func removeItem(at indexPath: IndexPath) -> MainTableViewItem? {
        if item(at: indexPath) != nil {
            return dataSource.sections[indexPath.section].items.remove(at: indexPath.row)
        }

        return nil
    }

    func removeSection(atIndex index: Int) -> MainTableViewSection? {
        guard index < dataSource.sections.count else { return nil }

        return dataSource.sections.remove(at: index)
    }

    func removeData() {
        dataSource.sections.removeAll()
    }

    func reloadData() {
        tableView.reloadData()
    }
}

extension MainTableViewAdapter: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section < dataSource.sections.count else { return 0 }

        return dataSource.sections[section].items.count
    }

}

extension MainTableViewAdapter: UITableViewDelegate {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeue(at: indexPath)
        let cellItem = item(at: indexPath)
        cell.titleLabel.text = cellItem?.title

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedItem(at: indexPath)
    }
}

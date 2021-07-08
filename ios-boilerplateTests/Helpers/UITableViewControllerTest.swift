//
//  UITableViewControllerTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit

extension UITableViewController {

    func enlargeTableViewForSnapshot() {
        tableView.resizeToContentSize()
    }
}

extension UITableView {

    func resizeToContentSize() {
        layoutIfNeeded()
        frame.size = contentSize
    }
}

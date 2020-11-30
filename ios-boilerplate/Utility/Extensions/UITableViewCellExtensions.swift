//
//  UITableViewCellExtensions.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static func register(to tableView: UITableView?) {
        let className = String(describing: Self.self)
        let nib = UINib(nibName: className, bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: className)
    }
}

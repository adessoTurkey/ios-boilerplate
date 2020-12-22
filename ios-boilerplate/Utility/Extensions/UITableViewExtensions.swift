//
//  UITableViewExtension.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }

    func dequeue<T: UITableViewCell>(withIdentifier identifier: String = String(describing: T.self), at indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else { fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }

    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from tableView \(self)") }
        return cell
    }
}

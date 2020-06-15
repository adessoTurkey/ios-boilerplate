//
//  UITableViewExtensions.swift
//  ios-boilerplate
//
//  Created by Emre Çetiner on 15.06.2020.
//  Copyright © 2020 adesso Turkey. All rights reserved.
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
}

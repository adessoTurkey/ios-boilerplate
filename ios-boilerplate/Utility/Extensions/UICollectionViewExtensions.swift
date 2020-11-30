//
//  UICollectionViewExtensions.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(withIdentifier identifier: String = String(describing: T.self), for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier \(identifier) from collectionView \(self)")
        }
        return cell
    }
}

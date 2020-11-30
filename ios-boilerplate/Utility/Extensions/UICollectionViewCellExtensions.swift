//
//  UICollectionViewCellExtensions.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static func register(to collectionView: UICollectionView?) {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: String(describing: Self.self))
    }
}

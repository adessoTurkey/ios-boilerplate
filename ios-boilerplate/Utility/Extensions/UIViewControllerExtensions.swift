//
//  UIViewControllerExtensions.swift
//  ios-boilerplate
//
//  Copyright © 2020 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        func instanceFromNib<T: UIViewController>() -> T {
            return T(nibName: String(describing: self), bundle: nil)
        }

        return instanceFromNib()
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

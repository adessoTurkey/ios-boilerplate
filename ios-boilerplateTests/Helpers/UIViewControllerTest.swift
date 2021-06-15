//
//  UIViewControllerTest.swift
//  ios-boilerplateTests
//
//  Created by Baha Ulug on 15.06.2021.
//  Copyright © 2021 Adesso Turkey. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Fake view life cycle
    func prepareForSnapshot() {
        view.bounds = UIScreen.main.bounds
        viewWillAppear(false)
        viewDidAppear(false)
    }

    @discardableResult func embedInWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = self
        window.makeKeyAndVisible()
        return window
    }

    func simulateAppearanceViewLifeCycle(animated: Bool = false) {
        loadViewIfNeeded()
        viewWillAppear(animated)
        viewDidAppear(animated)
    }

    func simulateGoBackOnNavigationController() {
        willMove(toParent: nil)
    }

    func enlargeViewToScrollViewContentForSnapshot() {
        let subScrollView = view.subviews.first(where: { $0 is UIScrollView })
        guard let scrollView = subScrollView as? UIScrollView else { fatalError("This ViewController has no scrollView") }

        view.layoutIfNeeded()
        let height = view.bounds.height - scrollView.bounds.height + scrollView.contentSize.height
        let size = CGSize(width: view.bounds.width, height: height)
        view.frame = CGRect(origin: .zero, size: size)
        view.layoutIfNeeded()
    }
}

extension UISwitch {
    func simulateValueChangeTo(_ isOn: Bool) {
        self.isOn = isOn
        self.sendActions(for: .valueChanged)
    }
}

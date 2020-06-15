//
//  MainTableViewDataSource.swift
//  ios-boilerplate
//
//  Created by Emre Çetiner on 15.06.2020.
//  Copyright © 2020 adesso Turkey. All rights reserved.
//

import Foundation

struct MainTableViewItem {

    var title: String?
}

struct MainTableViewSection {

    var items = [MainTableViewItem]()
}

struct MainTableViewDataSource {

    var sections = [MainTableViewSection]()
}

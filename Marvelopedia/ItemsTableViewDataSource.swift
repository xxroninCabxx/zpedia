//
//  ItemsTableViewDataSource.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

protocol ItemsTableViewDataSource: UITableViewDataSource {
    
    associatedtype T
    var items:[T] {get}
    weak var tableView: UITableView? {get}
    weak var delegate: UITableViewDelegate? {get}
    
    init(items: [T], tableView: UITableView, delegate: UITableViewDelegate)
    
    func setupTableView()
    
}

extension ItemsTableViewDataSource {
    func setupTableView() {
        self.tableView?.dataSource = self
        self.tableView?.delegate = self.delegate
        self.tableView?.reloadData()
    }
}


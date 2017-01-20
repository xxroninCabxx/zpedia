//
//  CharacterDataSource.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

final class CharactersDataSource: NSObject, ItemsTableViewDataSource {
    
    var items:[Character] = []
    weak var tableView: UITableView?
    weak var delegate: UITableViewDelegate?
    
    required init(items: [Character], tableView: UITableView, delegate: UITableViewDelegate) {
        
        self.items = items
        self.tableView = tableView
        self.delegate = delegate
        super.init()
        tableView.register(cellType: CharacterTableCell.self)
        self.setupTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: CharacterTableCell.self)
        let character = self.items[indexPath.row]
        cell.setup(item: character)
        return cell
    }
}

class CharactersTableDelegate: NSObject, UITableViewDelegate {
    
    let delegate: CharactersDelegate
    
    init(_ delegate: CharactersDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CharacterTableCell.height()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.didSelectCharacter(at: indexPath)
    }
}

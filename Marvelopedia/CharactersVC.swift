//
//  CharactersVC.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/10/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

protocol CharactersDelegate {
    func didSelectCharacter(at index: IndexPath)
}

final class CharactersVC: UIViewController {

    var apiManager: MarvelAPICalls = MarvelAPIManager()
    var tableDataSource: CharactersDataSource?
    var tableDelegate: CharactersTableDelegate?
    
    var characters: [Character] = []
    var showingAsList = true
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

}

extension CharactersVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        fetchCharacters()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        activityIndicator.startAnimating()
        if let destination = segue.destination as? CharacterVC {
            if let character = sender as? Character {
                let urls = character.urls
                let wiki = urls!.filter( { $0.type == "wiki" })
                let wikiUrlString = (wiki[0].url)
                destination.wikiUrl = wikiUrlString
                destination.imgPath = "\(character.thumbImage!.path).\(character.thumbImage!.imageExtension)"
                destination.name = character.name
            }
            activityIndicator.stopAnimating()
        }
        
        if let destination = segue.destination as? LimitedCharacterVC {
            if let character = sender as? Character {
                destination.name = character.name
                destination.bio = character.bio
                destination.imageUrl = character.thumbImage!.fullPath()
                print(character.thumbImage!.fullPath())
            }
        }
    }
}
   
extension CharactersVC {
        func fetchCharacters(for query: String? = nil) {
            tableView.isHidden = false
            activityIndicator.startAnimating()
            apiManager.characters(query: query) { characters in
                self.activityIndicator.stopAnimating()
                if let characters = characters {
                    print(characters)
                    self.setupTableView(with: characters)
                }
        }
    }

    func setupSearchBar() {
        self.searchBar.delegate = self
    }
            
    func setupTableView(with characters: [Character]) {
        self.characters = characters
        showingAsList = true
        tableView.isHidden = false
        tableDelegate = CharactersTableDelegate(self)
        tableDataSource = CharactersDataSource(items: characters, tableView: self.tableView, delegate: tableDelegate!)
    }
}

extension CharactersVC: CharactersDelegate {
    func didSelectCharacter(at index: IndexPath) {
        searchBar.resignFirstResponder()
        let character = characters[index.row]
        let urlCount = character.urlCount()
        if urlCount > 2 {
            performSegue(withIdentifier: "CharacterDetails", sender: character)
        } else if urlCount <= 2 {
            performSegue(withIdentifier: "LimitedDetails", sender: character)
        }
    }
}

extension CharactersVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            fetchCharacters(for: query)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}









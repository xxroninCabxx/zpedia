//
//  ComicsVC.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/13/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

protocol ComicsDelegate {
    func didSelectComic(at index: IndexPath)
}

final class ComicsVC: UIViewController {
    
    var apiManager: MarvelAPICalls = MarvelAPIManager()
    var collectionDatasource: ComicsCollectionDataSource?
    var collectionDelegate: ComicsCollectionDelegate?
    
    var comics: [Comic] = []
    var showingAsList = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
   
}

extension ComicsVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        fetchComics()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        self.activityIndicator.startAnimating()
        if let destination = segue.destination as? ComicVC {
            if let comic = sender as? Comic {
                destination.comicTitle = comic.title
                destination.descrip = comic.description
                destination.id = comic.id
                destination.issue = comic.issueNumber
                destination.pageCount = comic.pageCount
                destination.format = comic.format
                destination.imgUrl = "\(comic.thumbImage!.path).\(comic.thumbImage!.imageExtension)"
                let urls = comic.urls
                let detail = urls!.filter( { $0.type == "detail" })
                let detailUrlString = (detail[0].url)
                destination.detailUrl = detailUrlString
                let creators = (comic.creators)!
                let returned = creators.returned
                if returned > 0 && returned < 2 {
                    let cName00 = creators.items?[0].name
                    let cRole00 = creators.items?[0].role
                    destination.creators = "\(cRole00!): \(cName00!)"
                }
                if returned < 2 && returned > 1 {
                    let cName00 = creators.items?[0].name
                    let cRole00 = creators.items?[0].role
                    let cName01 = creators.items?[1].name
                    let cRole01 = creators.items?[1].role
                    destination.creators = "\(cRole00!): \(cName00!), \(cRole01!): \(cName01!)"
                } else if returned > 2 {
                    let cName00 = creators.items?[0].name
                    let cRole00 = creators.items?[0].role
                    let cName01 = creators.items?[1].name
                    let cRole01 = creators.items?[1].role
                    let cName02 = creators.items?[2].name
                    let cRole02 = creators.items?[2].role
                    destination.creators = "\(cRole00!): \(cName00!), \(cRole01!): \(cName01!), \(cRole02!): \(cName02!)"
                }
            }
        }
        self.activityIndicator.stopAnimating()
    }
}

extension ComicsVC {
    func fetchComics(for query: String? = nil) {
        collectionView.isHidden = false
        activityIndicator.startAnimating()
        apiManager.comics(query: query) { comics in
            self.activityIndicator.stopAnimating()
            if let comics = comics {
                self.setupCollectionView(with: comics)
            }
        }
    }
    
    func setupSearchBar() {
        self.searchBar.delegate = self
    }
    
    func setupCollectionView(with comics: [Comic]) {
        self.comics = comics
        showingAsList = false
        collectionView.isHidden = false
        collectionDelegate = ComicsCollectionDelegate(self)
        collectionDatasource = ComicsCollectionDataSource(items: comics, collectionView: self.collectionView, delegate: collectionDelegate!)
    }
}

extension ComicsVC: ComicsDelegate {
    func didSelectComic(at index: IndexPath) {
        searchBar.resignFirstResponder()
        let comic = comics[index.row]
        performSegue(withIdentifier: "ComicDetail", sender: comic)
    }
}


extension ComicsVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let query = searchBar.text ?? ""
        if !query.isEmpty {
            fetchComics(for: query)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}








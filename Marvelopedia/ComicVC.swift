//
//  ComicVC.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/14/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

final class ComicVC: UIViewController {
    
    @IBOutlet weak var comicImg: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var issueLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var pageCountLbl: UILabel!
    @IBOutlet weak var descrTV: UITextView!
    @IBOutlet weak var creatorsLbl: UILabel!
    @IBOutlet weak var formatLbl: UILabel!
    @IBOutlet weak var launchMarvelStore: MMButton!
    
    var comicTitle: String!
    var descrip: String!
    var issue: Double!
    var id: Int!
    var pageCount: Int!
    var imgUrl: String!
    var creators: String!
    var format: String!
    var detailUrl: String!
    
    @IBAction func launchMarvel(_ sender: UIButton) {
            UIApplication.shared.openURL(NSURL(string: "\(detailUrl!)")! as URL)
    }
}

extension ComicVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        updateImg()
    }
    
    
}

extension ComicVC {
    
    func updateUI() {
        titleLbl.text = self.comicTitle.isEmpty ? "No Data" :comicTitle
        descrTV.text = self.descrip.isEmpty ? "No Data" :descrip
        issueLbl.text = "\(self.id!)"
        pageCountLbl.text = "\(self.pageCount!)"
        idLbl.text = "\(self.id!)"
        creatorsLbl.text = self.creators
        formatLbl.text = self.format
    }
    
    func updateImg() {
        comicImg.loadImageUsingCacheWithUrlString(self.imgUrl)
    }
    
}

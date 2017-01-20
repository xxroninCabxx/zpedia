//
//  LimitedCharacterVC.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/12/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

class LimitedCharacterVC: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var bioLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    var character: Character?
    
    var name: String?
    var bio: String?
    var imageUrl: String!
    var thumb: ThumbImage?
    
}

extension LimitedCharacterVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        print(self.imageUrl)
    }
}

extension LimitedCharacterVC {
    
    func setupView() {
        
        nameLbl.text = name
        bioLbl.text = (bio?.isEmpty)! ? "No Description Available :(" : bio
        image.loadImageUsingCacheWithUrlString(self.imageUrl)
        
    }
}

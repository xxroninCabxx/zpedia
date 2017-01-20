//
//  CharacterCollectionTVCell.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit
import Reusable

final class CharacterTableCell: UITableViewCell, NibReusable {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDesc: UILabel!
    
    static func height() -> CGFloat {
        return 105
    }
    
    func setup(item: Character) {
        characterName.text = item.name
        characterDesc.text = item.bio.isEmpty ? "No Description" : item.bio
        thumbImg.download(image: item.thumbImage?.fullPath() ?? "")
        thumbImg.clipsToBounds = true
      
    }

}

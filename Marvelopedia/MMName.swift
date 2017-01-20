//
//  MMName.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 8/22/16.
//  Copyright © 2016 Cory. All rights reserved.
//

import UIKit

class MMName: UILabel {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.9).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
    }

}

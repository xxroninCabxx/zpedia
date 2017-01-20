//
//  MMButton.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/10/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit

class MMButton: UIButton {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.9).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
    }

}

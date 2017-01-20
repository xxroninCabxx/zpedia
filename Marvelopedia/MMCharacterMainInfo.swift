//
//  MMCharacterMainInfo.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 8/22/16.
//  Copyright © 2016 Cory. All rights reserved.
//

import UIKit

class MMCharacterMainInfo: UIView {

    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 1, height: 10)
        layer.borderWidth = 3
        layer.borderColor = UIColor.red.cgColor
        
    }


}

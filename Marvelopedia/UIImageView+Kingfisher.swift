//
//  UIImageView+Kingfisher.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func download(image url: String) {
        guard let imageURL = URL(string:url) else {
            return
        }
        self.kf.setImage(with: ImageResource(downloadURL: imageURL))
    }
}

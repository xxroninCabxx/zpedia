//
//  ComicsCollectionCell.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/13/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import UIKit
import Reusable

final class ComicCollectionCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    static func size(for parentWidth: CGFloat) -> CGSize {
        let numberOfCells = CGFloat(4)
        let width = parentWidth / numberOfCells + 15
        return CGSize(width: width, height: width * 2 - 30)
    }
    
    func setup(item: Comic) {
        comicName.text = item.title
        comicImage.download(image: item.thumbImage?.fullPath() ?? "")
        comicImage.clipsToBounds = true
        comicImage.layer.masksToBounds = true
        comicImage.contentMode = .scaleAspectFill
    }
    
}

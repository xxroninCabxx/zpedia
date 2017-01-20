//
//  ThumbImage.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct ThumbImage {
    var path: String = ""
    var imageExtension: String = ""
    
    func fullPath() -> String {
        
        return "\(path).\(imageExtension)"
    }
}

extension ThumbImage: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        path            <- map["path"]
        imageExtension  <- map["extension"]
    }
}

//
//  Character.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 12/4/16.
//  Copyright © 2016 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Character {
    var id: Int = 0
    var name: String = ""
    var bio: String = ""
    var thumbImage: ThumbImage?
    var urls: [Urls]!
    
    func urlCount() -> Int {
        return urls.count
    }
}

extension Character: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        bio         <- map["description"]
        thumbImage  <- map["thumbnail"]
        urls        <- map["urls"]
    }
}








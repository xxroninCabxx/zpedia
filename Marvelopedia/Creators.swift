//
//  Creators.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/14/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Creators {
    var available: Int = 0
    var collectionURI: String = ""
    var items: [Items]?
    var returned: Int = 0
}

extension Creators: Mappable {
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        items               <- map["items"]
        available           <- map["available"]
        collectionURI       <- map["collectionURI"]
        returned            <- map["returned"]
    }
}

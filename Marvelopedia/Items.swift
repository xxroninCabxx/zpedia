//
//  Items.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/15/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Items {
    var name: String = ""
    var role: String = ""
    var resourceURI: String = ""
}

extension Items: Mappable {
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        name        <- map["name"]
        role        <- map["role"]
        resourceURI <- map["resourceURI"]
    }
}


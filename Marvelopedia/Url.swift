//
//  Url.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/15/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Url {
    var type: String = ""
    var url: String = ""

}

extension Url: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        type        <- map["type"]
        url         <- map["url"]
    }
}

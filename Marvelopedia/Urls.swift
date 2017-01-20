//
//  Urls.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Urls {
    
    var type: String = ""
    var url: String = ""
}

extension Urls: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        type    <- map["type"]
        url     <- map["url"]
    }
}

//
//  CollectionURI.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/13/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct CollectionURI {
    
    var collectionURI: String = ""
}

extension CollectionURI: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        collectionURI   <- map["collectionURI"]
    }
}

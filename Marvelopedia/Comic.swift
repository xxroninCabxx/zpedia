//
//  Comics.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/13/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import ObjectMapper

struct Comic {
    
    var id: Int = 0
    var title: String = ""
    var issueNumber: Double = 0
    var description: String = ""
    var pageCount: Int = 0
    var thumbImage: ThumbImage?
    var urls: [Urls]?
    var creators: Creators?
    var format: String = ""
}

extension Comic: Mappable {
    init(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id              <- map["id"]
        title           <- map["title"]
        issueNumber     <- map["issueNumber"]
        description     <- map["description"]
        pageCount       <- map["pageCount"]
        thumbImage      <- map["thumbnail"]
        urls            <- map["urls"]
        creators        <- map["creators"]
        format          <- map["format"]
    }
}

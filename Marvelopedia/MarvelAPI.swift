//
//  MarvelAPI.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import Moya
import CryptoSwift
import Dollar

fileprivate struct MarvelAPIConfig {
//    fileprivate static let keys = MarvelKeys()
    static let privatekey = MarvelKeys.privateKey
    static let apikey = MarvelKeys.publicKey
    static let ts = Date().timeIntervalSince1970.description
    static let hash = "\(ts)\(privatekey)\(apikey)".md5()
}

enum MarvelAPI {
    case characters(String?)
    case character(String)
    case comics(String?)
    case comic(String)
}

extension MarvelAPI: TargetType {
   
    var baseURL: URL { return URL(string: "http://gateway.marvel.com/")! }
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .character(let characterId):
            return "/v1/public/characters/\(characterId)"
        case .comics:
            return "/v1/public/comics"
        case .comic(let comicId):
            return "/v1/public/comics/\(comicId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .characters, .character:
            return .get
        case .comics, .comic:
            return .get
        }
    }
    
    func authParameters() -> [String: String] {
        return ["apikey": MarvelAPIConfig.apikey,
                "ts": MarvelAPIConfig.ts,
                "hash": MarvelAPIConfig.hash]
    }
    
    var parameters: [String: Any]? {

        switch self {
        case .characters(let query):
            if let query = query {
                return $.merge(authParameters(),
                               ["nameStartsWith": query])
            }
            return authParameters()
        
        case .character(let characterId):
            return $.merge(authParameters(),
                    ["characterId": characterId])
            
        case .comics(let query):
            if let query = query {
                return $.merge(authParameters(),
                                ["titleStartsWith": query])
            }
            return authParameters()
            
        case .comic(let comicId):
            return $.merge(authParameters(),
                    ["title": comicId])
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .characters, .character:
            return URLEncoding.default
            
        case .comics, .comic:
            return URLEncoding.default
        }
        
    }
    
    var task: Task {
        return .request
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
}

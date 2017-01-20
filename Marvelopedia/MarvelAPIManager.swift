//
//  MarvelAPIManager.swift
//  Marvelopedia
//
//  Created by Cory Billeaud on 1/11/17.
//  Copyright © 2017 Cory. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper
import Moya_ObjectMapper

extension Response {
    func removeAPIWrappers() -> Response {
        guard let json = try? self.mapJSON() as? Dictionary<String, AnyObject>,
            let results = json?["data"]?["results"] ?? [],
            let newData = try? JSONSerialization.data(withJSONObject: results, options: .prettyPrinted) else {
                return self
        }
        
        let newResponse = Response(statusCode: self.statusCode,
                                   data: newData,
                                   response: self.response)
        
        print(results)
        
        return newResponse
    }
}

struct MarvelAPIManager {
    
    let provider: RxMoyaProvider<MarvelAPI>
    let disposeBag = DisposeBag()
    
    init() {
        provider = RxMoyaProvider<MarvelAPI>()
    }
}

extension MarvelAPIManager {
    typealias AdditionalStepsAction = (() -> ())
    
    fileprivate func requestObject<T: Mappable>(_ token: MarvelAPI, type: T.Type,
                                   completion: @escaping (T?) -> Void,
                                   additionalSteps: AdditionalStepsAction? = nil) {
    provider.request(token)
        .debug()
        .mapObject(T.self)
        .subscribe { event -> Void in
            switch event {
            case .next(let parsedObject):
                completion(parsedObject)
                additionalSteps?()
            case .error(let error):
                print(error)
                completion(nil)
            default:
                break
            }
        }.addDisposableTo(disposeBag)
    }
    
    fileprivate func requestArray<T: Mappable>(_ token: MarvelAPI, type: T.Type,
                                    completion: @escaping ([T]?) -> Void,
                                    additionalSteps: AdditionalStepsAction? = nil) {
        provider.request(token)
            .debug()
            .map { response -> Response in
                return response.removeAPIWrappers()
            }
            .mapArray(T.self)
            .subscribe { event -> Void in
                switch event {
                case .next(let parsedArray):
                    completion(parsedArray)
                    additionalSteps?()
                case .error(let error):
                    print(error)
                    completion(nil)
                default:
                    break
                }
            }.addDisposableTo(disposeBag)
        }
}

protocol MarvelAPICalls {
    func characters(query: String?, completion: @escaping ([Character]?) -> Void)
    func comics(query: String?, completion: @escaping ([Comic]?) -> Void)
}

extension MarvelAPIManager: MarvelAPICalls {
    
    func characters(query: String? = nil, completion: @escaping ([Character]?) -> Void) {
        requestArray(.characters(query),
                     type: Character.self,
                     completion: completion)
    }
    
    func comics(query: String? = nil, completion: @escaping ([Comic]?) -> Void) {
        requestArray(.comics(query),
                     type: Comic.self,
                     completion: completion)
    }
}



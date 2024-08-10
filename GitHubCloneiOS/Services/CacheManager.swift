//
//  CacheManager.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

actor CacheManager : ObservableObject {
    static let shared = CacheManager()
    private init(){}
    
    private var cache: NSCache<NSString, NSData> = {
        let countLimit = 500
        let nscache = NSCache<NSString, NSData>()
        nscache.countLimit = countLimit
        nscache.totalCostLimit = 1024 * 1024 * countLimit
        return nscache
    }()
    
    func cacheObject(key: String, object: Data) {
        cache.setObject(object as NSData, forKey: key as NSString)
    }
    
    func getObject(forkey key: String) -> Data? {
        cache.object(forKey: key as NSString) as Data?
    }
}

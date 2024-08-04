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
    
    private var cache: NSCache<NSString, UIImage> = {
        let countLimit = 350
        let nscache = NSCache<NSString, UIImage>()
        nscache.countLimit = countLimit
        nscache.totalCostLimit = 1024 * 1024 * countLimit
        return nscache
    }()
    
    func cacheObject(key: String, object: UIImage) {
        cache.setObject(object, forKey: key as NSString)
    }
    
    func getObject(forkey key: String) -> UIImage? {
        cache.object(forKey: key as NSString)
    }
}

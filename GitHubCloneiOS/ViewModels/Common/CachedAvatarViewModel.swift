//
//  CachedAvatarViewModel.swift
//  GitHubCloneiOS
//
//  Created by Clement Skosana on 2024/08/04.
//

import SwiftUI

class CachedAvatarViewModel: ObservableObject {
    let apiService = APIService() //TODO: should be injected as a protocol.
    let imageCacheManager = CacheManager.shared //TODO: how to not make this a singleton as caching doesn't work well if it's not. EnvironmentObject?
    let imageKey: String
    
    @Published var imageState: ImageState = .loading
    @Published var uiImage: UIImage? = nil
    
    init(imageKey: String) {
        self.imageKey = imageKey
    }
    
    func getImage(from urlString: String) async {
        if let cachedImage = await imageCacheManager.getObject(forkey: imageKey) {
            print("Getting cachedImage", imageKey)
            await MainActor.run {
                uiImage = cachedImage
                imageState = .success
            }
        } else {
            await downloadImage(from: urlString, key: imageKey)
        }
    }
    
    private func downloadImage(from urlString: String, key: String) async {
        print("Downloading Image", imageKey)
        let imageDataResults = await apiService.getData(from: urlString)
        
        switch imageDataResults {
        case .success(let imageData):
            if let image = UIImage(data: imageData) {
                await MainActor.run {
                    uiImage = image
                    imageState = .success
                }
                await imageCacheManager.cacheObject(key: imageKey, object: image)
            } else {
                await MainActor.run {
                    imageState = .failure
                }
            }
        case .failure(_):
            await MainActor.run {
                imageState = .failure
            }
        }
    }
}

enum ImageState {
    case loading, failure, success
}

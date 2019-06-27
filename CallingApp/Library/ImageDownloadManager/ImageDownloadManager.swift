//
//  ImageDownloadManager.swift
//  ImageSearch
//
//  Created Manoj Saini on 6/19/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import Foundation
import UIKit

typealias ImageDownloadHandler = (_ image: UIImage?, _ url: URL, _ indexPath: IndexPath?, _ error: Error?) -> Void

final class ImageDownloadManager {
    lazy var imageDownloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.ImageSearch.imageDownloadqueue"
        queue.qualityOfService = .userInteractive
        return queue
    }()
    let imageCache = NSCache<NSString, UIImage>()
    static let shared = ImageDownloadManager()
    private init () {}
    
    func downloadImage(_ flickrPhoto: FlickrPhoto, indexPath: IndexPath?, size: String = "t", handler: @escaping ImageDownloadHandler) {
        guard let url = flickrPhoto.flickrImageURL(size) else {
            return
        }
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
           handler(cachedImage, url, indexPath, nil)
        } else {
            if let operations = (imageDownloadQueue.operations as? [ImgDownloadOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true }), let operation = operations.first {
                operation.queuePriority = .veryHigh
            }else {
                let operation = ImgDownloadOperation(url: url, indexPath: indexPath)
                if indexPath == nil {
                    operation.queuePriority = .high
                }
                operation.downloadHandler = { (image, url, indexPath, error) in
                    if let newImage = image {
                        self.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                    }
                    handler(image, url, indexPath, error)
                }
                imageDownloadQueue.addOperation(operation)
            }
        }
    }
    
    func slowDownImageDownloadTaskfor (_ flickrPhoto: FlickrPhoto) {
        guard let url = flickrPhoto.flickrImageURL() else {
            return
        }
        if let operations = (imageDownloadQueue.operations as? [ImgDownloadOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true }), let operation = operations.first {
            operation.queuePriority = .low
        }
    }
    
    func cancelAll() {
        imageDownloadQueue.cancelAllOperations()
    }
}

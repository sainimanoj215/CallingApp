//
//  ImageDownloadManager.swift
//  CallingApp
//
//  Created Manoj Saini on 6/26/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import UIKit

typealias ImageDownloadHandler = (_ image: UIImage?, _ url: URL, _ indexPath: IndexPath?, _ error: Error?) -> Void

final class ImageDownloadManager {
    lazy var imageDownloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.name = "com.Manoj.imageDownloadqueue"
        queue.qualityOfService = .userInteractive
        return queue
    }()
    let imageCache = NSCache<NSString, UIImage>()
    static let shared = ImageDownloadManager()
    private init () {}
    
    func downloadImage(imageUrl: String, indexPath: IndexPath?, handler: @escaping ImageDownloadHandler) {
        guard let url = URL.init(string: imageUrl) else {
            return
        }
        if let cachedImage = self.imageCache.object(forKey: url.absoluteString as NSString) {
            handler(cachedImage, url, indexPath, nil)
        } else {
            if let operations = (self.imageDownloadQueue.operations as? [ImgDownloadOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true }), let operation = operations.first {
                operation.queuePriority = .veryHigh
            }else {
                let operation = ImgDownloadOperation(url: url, indexPath: indexPath)
                if indexPath == nil {
                    operation.queuePriority = .high
                }
                
//                self.imageDownloadQueue.addOperation(operation)
                self.imageDownloadQueue.addOperation {
                    operation.downloadImageFromUrl({ (image, url, indexPath, error) in
                        if let newImage = image {
                            self.imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                        }
                        handler(image, url, indexPath, error)
                    })
                }
            }
        }
    }
    
    func slowDownImageDownloadTaskfor (imageUrl: String) {
        guard let url = URL.init(string: imageUrl) else {
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

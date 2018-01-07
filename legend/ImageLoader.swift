//
//  ImageLoader.swift
//  24tv
//
//  Created by Boris Kuznetsov on 03/01/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import Foundation
import UIKit

class IMAGELOADER : NSObject {
    
    static let sharedInstance = IMAGELOADER()
    
    private var cache : [String: UIImage] = [String: UIImage]()
    
    override private init() {}
    
    func getImage (_ path: String!, useCache: Bool = false, callback: @escaping (Error?, UIImage?) -> Void) -> URLSessionDataTask! {
        
        if path == nil {return nil}

        if useCache {
            if self.cache[path] != nil {
                callback(nil, self.cache[path])
                return nil
            }
        }
        
        let downloadTask : URLSessionDataTask = URLSession.shared.dataTask(with: URL(string: path)!, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in

            if (error != nil) {
                callback(error, nil)
                return
            }
            
            if data != nil {
                let image = UIImage(data: data!)
                DispatchQueue.main.async {
                    if useCache {
                        self.cache[path] = image
                    }
                    callback(nil, image)
                }
                return
            }
            
        })
        DispatchQueue.main.async {
            downloadTask.resume()
        }
        return downloadTask
    }
    
    func getImageSync (_ path: String, callback: @escaping (Error?, UIImage?) -> Void) -> URLSessionDataTask {
        let downloadTask : URLSessionDataTask = URLSession.shared.dataTask(with: URL(string: path)!, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error != nil) {
                callback(error, nil)
                return
            }
            
            if data != nil {
                let image = UIImage(data: data!)
                callback(nil, image)
            }
            
        })
        downloadTask.resume()
        return downloadTask
    }
}

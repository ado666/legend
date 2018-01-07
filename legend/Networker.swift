//
//  Networker.swift
//  legend
//
//  Created by Boris Kuznetsov on 01/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//


import Foundation
import UIKit
import Alamofire

class NETWORKER: NSObject {
    static let sharedInstance = NETWORKER()
    override private init() {}
    
    func get(url: String, parameters: [String: Any]?, completion: (([String: Any]?) -> Void)!) -> Void {
        Alamofire.request(
            url,
            method: .get,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: [:])
        .validate()
        .responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while get request: \(response.result.error ?? "error" as! Error)")
                if (completion != nil) { completion(nil) }
                return
            }
            
            guard let data = response.result.value as? [[String: Any]] else {
                print("returned bad data")
                if (completion != nil) { completion(nil) }
                return
            }
            
            if (completion != nil) { completion(data[0]) }
        }
    }
}




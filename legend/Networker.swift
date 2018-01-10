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
    
    typealias _getHandler = ([String: Any?]?, Int?, String?)  -> Void
    func get(url: String, parameters: [String: Any]?, completion: _getHandler?) {
        var autorizedURL = ""
        if Local.sharedInstance.accessToken != nil {
            autorizedURL = String(format: "%@?access_token=%@", url, Local.sharedInstance.accessToken)
        }else{
            autorizedURL = String(format: "%@", url)
        }
        Alamofire.request(
            autorizedURL,
            method: .get,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: [:])
            .validate()
            .responseJSON { (response) -> Void in
                print(String(format: "- End request to url: %@ with code: %d", autorizedURL, (response.response?.statusCode)!))
                guard response.result.isSuccess else {
                    print(String(format: "-- error while get request with error %d", (response.response?.statusCode)!))
                    guard let handler = completion else {
                        return
                    }
                    return handler(nil, response.response?.statusCode, nil)
                }
                
                guard let data = response.result.value as? [String: Any] else {
                    print(String(format: "-- error while parsing data. data: %@", response.result.value as! CVarArg))
                    guard let handler = completion else {
                        return
                    }
                    return handler(nil, response.response?.statusCode, nil)
                }
                guard let handler = completion else {
                    return
                }
                handler(data, response.response?.statusCode, nil)
        }
    }
    
    typealias _postHandler = ([String: Any?]?, Int?, String?)  -> Void
    func post(url: String, parameters: [String: Any]?, completion: _postHandler?) {
        var autorizedURL = ""
        if Local.sharedInstance.accessToken != nil {
            autorizedURL = String(format: "%@?access_token=%@", url, Local.sharedInstance.accessToken)
        }else{
            autorizedURL = String(format: "%@", url)
        }
        Alamofire.request(
            autorizedURL,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default,
            headers: [:])
            .validate()
            .responseJSON { (response) -> Void in
                print(String(format: "- End request to url: %@ with code: %d", autorizedURL, (response.response?.statusCode)!))
                guard response.result.isSuccess else {
                    print(String(format: "-- error while get request with error %d", (response.response?.statusCode)!))
                    guard let handler = completion else {
                        return
                    }
                    return handler(nil, response.response?.statusCode, nil)
                }
                
                guard let data = response.result.value as? [String: Any] else {
                    print(String(format: "-- error while parsing data. data: %@", response.result.value as! CVarArg))
                    guard let handler = completion else {
                        return
                    }
                    return handler(nil, response.response?.statusCode, nil)
                }
                guard let handler = completion else {
                    return
                }
                handler(data, response.response?.statusCode, nil)
        }
    }
}




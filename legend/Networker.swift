//
//  Networker.swift
//  legend
//
//  Created by Boris Kuznetsov on 01/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//


import Foundation
import UIKit

@objc
class NETWORKER: NSObject {
    static let sharedInstance = NETWORKER()

    var ACCESS_TOKEN : String = ""

    override private init() {}



    public func postAJAX (url: String, data: [String: Any], callback: @escaping (Error?, [String: AnyObject]) -> Void) {
        let host = "http://api.lgnd.im/v1.0"
        var uri = host + url

        if Local.sharedInstance.getStringValue(key: "accessToken") != nil {
            uri = uri + "?access_token=" + Local.sharedInstance.getStringValue(key: "accessToken")
        }
        debugPrint("tryyyyy", data)

        var str = "{"
        var isFirst = true
        for (key, val) in data {
            if isFirst == false {str += ","}

            if let strVal = val as? String {
                str += "\"" + key + "\" : \"" + strVal + "\""
            }else {
                str += "\"notification\" : {"
                str += "\"" + "notification_type" + "\" : \"" + "ios" + "\","
                str += "\"" + "token" + "\" : \"" + (val as! [String:String])["token"]! + "\""
                str += "}"
            }

            isFirst = false
        }
        str += "}"

        let myUrl = URL(string: uri)

        let request = NSMutableURLRequest(url:myUrl! as URL)
        request.httpMethod = "post"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpBody = str.description.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                debugPrint(uri, "status \(httpResponse.statusCode)")
            }
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject] {
                    callback(nil, (convertedJsonIntoDict))
                }
            } catch let error as NSError {
                print("error", error.localizedDescription)
            }

        }

        task.resume()
    }



    public func getAJAX (url: String, data: [AnyHashable: Any], callback: @escaping (Error?, [[String: Any]]?) -> Void) -> URLSessionDataTask {

        let host = "http://api.lgnd.im/v1.0" + url
        var urlWithParams = host + "?"

        if Local.sharedInstance.getStringValue(key: "accessToken") != nil {
            urlWithParams = urlWithParams + "access_token=" + Local.sharedInstance.getStringValue(key: "accessToken")
        }

        // Add one parameter
        for (key, val) in data {
            if val is String {
                urlWithParams = urlWithParams + "&\(key)=\((val as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
            }else {
                urlWithParams = urlWithParams + "&\(key)=\(val)"
            }
        }
        let myUrl = URL(string: urlWithParams)
        //        urlWithParams.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!


        let request = NSMutableURLRequest(url:myUrl!)

        request.httpMethod = "get"
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in

            if error != nil {
                debugPrint("error 200", error?.localizedDescription ?? "")
                callback(error, nil)
                return
            }

            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                    callback(nil, convertedJsonIntoDict)
                }else if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    callback(nil, [convertedJsonIntoDict])
                }else {
                    debugPrint("wuuut")
                }
            } catch let error as NSError {
                print("error 201", error.localizedDescription)
            }

        }

        task.resume()

        return task
    }

    public func deleteAjax (url: String, data: [AnyHashable: Any], callback: @escaping (Error?, [[String: Any]]?) -> Void) -> URLSessionDataTask {

        let host = "http://api.lgnd.im/v1.0" + url
        var urlWithParams = host + "?"

        if Local.sharedInstance.getStringValue(key: "accessToken") != nil {
            urlWithParams = urlWithParams + "access_token=" + Local.sharedInstance.getStringValue(key: "accessToken")
        }

        // Add one parameter
        for (key, val) in data {
            if val is String {
                urlWithParams = urlWithParams + "&\(key)=\((val as AnyObject).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
            }else {
                urlWithParams = urlWithParams + "&\(key)=\(val)"
            }
        }
        let myUrl = URL(string: urlWithParams)
        //        urlWithParams.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!


        let request = NSMutableURLRequest(url:myUrl!)

        request.httpMethod = "delete"
        let task = URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in

            if error != nil {
                debugPrint("error 200", error?.localizedDescription ?? "")
                callback(error, nil)
                return
            }

            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
                    callback(nil, convertedJsonIntoDict)
                }else if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    callback(nil, [convertedJsonIntoDict])
                }else {
                    debugPrint("wuuut")
                }
            } catch let error as NSError {
                print("error 201", error.localizedDescription)
            }

        }

        task.resume()

        return task
    }
}




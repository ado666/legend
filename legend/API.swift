//
//  API.swift
//  legend
//
//  Created by Борис Кузнецов on 07/01/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import Foundation
import UIKit

class API: NSObject {
    static let sharedInstance = API()
    static let url = "http://api.lgnd.im/v1.0/"
    
    override private init() {}
    
    // MARK: - API Abstract
    typealias _call_get_handler = ([[String: Any?]]?, Int?, [[String: Any]]?)  -> Void
    typealias _call_post_handler = ([String: Any?]?, Int?, [[String: Any]]?)  -> Void
    func authenticate () {
        if Local.sharedInstance.deviceId == nil {
            if Local.sharedInstance.facebookAC == nil {
                self.facebookLogin()
            }else{
                self.apiRegister()
            }
        } else {
            self.apiLogin()
        }
    }
    
    func getIcons(completion: _call_get_handler!) {
        self._achievements_icons(completion: {(data, code, error) in
            completion(data, code, error)
        })
    }
    
    func apiLogin(){
        debugPrint(Local.sharedInstance.deviceId)
        self._auth_tokens(facebook_access_token: nil, deviceId: Local.sharedInstance.deviceId, completion: {(data, code, error) in
            
            if code == 403 || code == 404 {
                self.facebookLogin()
                return
            }
            
            guard let info = data, let accessToken = info["access_token"] as? String else {
                ERROR.sharedInstance.showError(label: "API", description: "Не удалось получить access_token")
                return print(String(format: "ERROR. cant get access token"))
            }
            Local.sharedInstance.accessToken = accessToken
        })
    }
    
    func apiRegister(){
        self._auth_tokens(facebook_access_token: Local.sharedInstance.facebookAC, deviceId: nil, completion: {(data, code, error) in
            
            guard let info = data, let accessToken = info["access_token"] as? String else {
                ERROR.sharedInstance.showError(label: "API", description: "Не удалось получить access_token")
                return print(String(format: "ERROR. cant get access token"))
            }
            Local.sharedInstance.accessToken = accessToken
            
            self._users_self_devices(
                vendor: "Apple",
                version: UIDevice.current.systemName + " " + UIDevice.current.systemVersion,
                serial: UIDevice.current.identifierForVendor!.uuidString,
                device_type: "phone",
                name: "device" + UIDevice.current.identifierForVendor!.uuidString,
                model: UIDevice.current.model,
                completion: {(data, code, error) in
                    guard let id = data!["id"] as? String else {
                        return ERROR.sharedInstance.showError(label: "Device", description: "Не удалось зарегистровать устройство")
                    }
                    
                    Local.sharedInstance.deviceId = id
            })
        })
    }
    
    func getUser(completion: _call_get_handler!){
        self._users_self(completion: {(data, code, error) in
            UserFactory.sharedInstance.selfInit(data: data!)
            completion(data, code, error)
        })
    }
    
    // MARK: - Facebook Abstract
    func facebookLogin(){
        debugPrint((UIApplication.shared.delegate as! AppDelegate))
//        (UIApplication.shared.delegate as! AppDelegate).navigator.showFacebookLogin()
    }
    
    // MARK: - API Concrete
    typealias _api_get_call_handler = ([[String: Any?]]?, Int?, [[String: Any]]?)  -> Void
    typealias _api_post_call_handler = ([String: Any?]?, Int?, [[String: Any]]?)  -> Void
    
    // MARK: achievement
    func _achievements_icons (completion: _api_get_call_handler!) {
        let uri = "achievements/icons"
        
        NETWORKER.sharedInstance.get(url: API.url + uri, parameters: nil, completion: {(data, code, error) in
            completion(data, code, error)
        })
    }
    
    // MARK: auth
    func _auth_tokens (facebook_access_token: String!, deviceId: String!, completion: _api_post_call_handler!) {
        let uri = "auth/tokens"
        
        var parameters : [String: Any] = [:]
        parameters["facebook_access_token"] = facebook_access_token
        parameters["device_id"] = deviceId
        
        NETWORKER.sharedInstance.post(url: API.url + uri, parameters: parameters, completion: {(data, code, error) in
            completion(data, code, error)
        })
    }
    
    // MARK: users
    func _users_self_devices (vendor: String, version: String, serial: String, device_type: String, name: String, model: String, completion: _api_post_call_handler!) {
        let uri = "users/self/devices"
        
        var parameters : [String: Any] = [:]
        
        parameters["device_type"] = device_type
        parameters["vendor"] = vendor
        parameters["version"] = version
        parameters["serial"] = serial
        parameters["name"] = name
        parameters["model"] = model
        
        NETWORKER.sharedInstance.post(url: API.url + uri, parameters: parameters, completion: {(data, code, error) in
            completion(data, code, error)
        })
    }
    
    func _users_self (completion: _api_get_call_handler!) {
        let uri = "users/self"
        
        NETWORKER.sharedInstance.get(url: API.url + uri, parameters: nil, completion: {(data, code, error) in
            completion(data, code, error)
        })
    }
    
    // MARK: friends
    func _users_self_friends (){
        
    }
    
    func _users_self_friends_request (){
        
    }
}





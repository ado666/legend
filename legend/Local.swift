//
//  Local.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class Local: NSObject {
    static let sharedInstance = Local()
    
    var deviceId: String! {
        get             {return self.getStringValue(key: "deviceId")}
        set(newVal)     {self.setStringValue(key: "deviceId", value: newVal)}
    }
    var facebookAC : String! {
        get             {return self.getStringValue(key: "facebookAC")}
        set(newVal)     {self.setStringValue(key: "facebookAC", value: newVal)}
    }
    var pushToken: String! {
        get             {return self.getStringValue(key: "pushToken")}
        set(newVal)     {self.setStringValue(key: "pushToken", value: newVal)}
    }
    var accessToken: String! {
        get             {return self.getStringValue(key: "accessToken")}
        set(newVal)     {self.setStringValue(key: "accessToken", value: newVal)}
    }

    override private init () {}

    func setStringValue (key: String, value: String!) -> Void {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: key)
    }

    func getStringValue (key: String) -> String! {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: key)
    }

}

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

    override private init () {}

    func setStringValue (key: String, value: String) -> Void {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: key)
    }

    func getStringValue (key: String) -> String! {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: key)
    }

}

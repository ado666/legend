//
//  UserFactory.swift
//  legend
//
//  Created by Boris Kuznetsov on 22/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class UserFactory: NSObject {
    static let sharedInstance = UserFactory()

    var collection = [UserStruct]()

    override private init() {}

    func fetch () {
        _ = NETWORKER.sharedInstance.getAJAX(url: "/users", data: [String: String](), callback: {(error, data) in
            if error == nil {
                debugPrint(data)
                for user in data! {


                    guard let id = user["id"] as? Int else {
                        continue
                    }
                    guard let username = user["username"] as? String else {
                        continue
                    }

                    var firstName: String! = nil
                    var lastName: String! = nil
                    var phone: String! = nil
                    var email: String! = nil

                    if !(user["first_name"] is NSNull || user["first_name"] == nil){firstName = user["first_name"] as! String}
                    if !(user["last_name"] is NSNull || user["last_name"] == nil){lastName = user["last_name"] as! String}
                    if !(user["phone"] is NSNull || user["phone"] == nil){phone = user["phone"] as! String}
                    if !(user["email"] is NSNull || user["email"] == nil){email = user["email"] as! String}

                    self.collection.append(UserStruct(id: id, username: username, firstName: firstName, lastName: lastName, phone: phone, email: email))
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fetchUsers"), object: self)
            }
        })
    }
}

struct UserStruct {
    var id: Int
    var username: String
    var firstName: String!
    var lastName: String!
    var phone: String!
    var email: String!
}

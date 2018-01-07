//
//  Achievement.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

@objc
class AchievementFactory: NSObject {
    static let sharedInstance = AchievementFactory()

    var collection: [AchievementStruct] = [AchievementStruct]()

    override private init() {}

    func fetch () {
        self.collection = [AchievementStruct]()
//        _ = NETWORKER.sharedInstance.getAJAX(url: "/achievements", data: [String: String](), callback: {(error, result) in
//            if error == nil {
//
//                for a in result! {
//                    guard let id = a["id"] as? String else {
//                        continue
//                    }
//
//                    guard let title = a["title"] as? String else {
//                        continue
//                    }
//
//                    guard let description = a["description"] as? String else {
//                        continue
//                    }
//
//                    var ico: String! = nil
////                    if ico = a["ico"] as? String {
////                        ico = a["ico"]
////                    }
//
//                    if !(a["image"] is NSNull) {ico = (a["image"] as! String)}
//
//                    let item = AchievementStruct(id: id, title: title, description: description, ico: ico)
//                    self.collection.append(item)
//                }
//            }
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "fetchAchievements"), object: self)
//        })
    }

}



struct AchievementStruct {
    var id: String
    var title: String
    var description: String
    var ico: String!
}

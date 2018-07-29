//
//  IconFactory.swift
//  legend
//
//  Created by Борис Кузнецов on 06/02/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//
//
//  Achievement.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

@objc
class IconFactory: NSObject {
    static let sharedInstance = IconFactory()
    
    var collection: [IconStruct] = [IconStruct]()
    
    override private init() {}
    
    typealias _icons_completition = ([IconStruct])  -> Void
    func getAll (completition: @escaping _icons_completition) {
        if self.collection.count == 0 {
            API.sharedInstance.getIcons(completion: {(data, code, error) in
                self.collection = [IconStruct]()
                for icon in data! {
                    self.collection.append(IconStruct(with: icon))
                }
                completition(self.collection)
            })
        }
        else {
            completition(self.collection)
        }
    }
    
}



struct IconStruct {
    init(with dictionary: [String: Any]?) {
        guard let dictionary = dictionary else { return }
        id = dictionary["id"] as? String
        url = dictionary["url"] as? String
        title = dictionary["title"] as? String
        keywords = dictionary["keywords"] as? String
    }
    var id: String!
    var url: String!
    var title: String!
    var keywords: String!
}


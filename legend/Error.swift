//
//  Error.swift
//  legend
//
//  Created by Борис Кузнецов on 10/01/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import Foundation
//

import Foundation
import UIKit

class ERROR : NSObject {
    
    static let sharedInstance = ERROR()
    
    func showError (label: String, description: String) {
        (UIApplication.shared.delegate as! AppDelegate).navigator.showError(label: label, description: description)
    }
    
}

//
//  RootLoginController.swift
//  legend
//
//  Created by Boris Kuznetsov on 06/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class RootLoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if Local.sharedInstance.getStringValue(key: "deviceId") != nil {
            self.tryLogin()
        }else {
            self.tryRegister()
        }
    }

    func tryLogin () {
//        _ = NETWORKER.sharedInstance.postAJAX(url: "/auth/tokens", data: ["device_id": Local.sharedInstance.getStringValue(key: "deviceId")], callback: {(error, data) in
//
//            guard let accessToken = data["access_token"] as? String else {
//                return self.tryRegister()
//            };
//            Local.sharedInstance.setStringValue(key: "accessToken", value: accessToken)
//
//            AchievementFactory.sharedInstance.fetch()
//            UserFactory.sharedInstance.fetch()
//            DispatchQueue.main.async {
//                self.parent?.performSegue(withIdentifier: "main_segue", sender: self)
//            }
//
//        })
    }

    func tryRegister () {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "register_segue", sender: self)
        }

    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

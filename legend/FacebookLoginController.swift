//
//  ViewController.swift
//  legend
//
//  Created by Boris Kuznetsov on 01/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin


class FacebookLoginController: UIViewController, LoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myLoginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        myLoginButton.center = view.center;
        myLoginButton.delegate = self
        view.addSubview(myLoginButton)
    }

    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        if let token = AccessToken.current {
            Local.sharedInstance.facebookAC = token.authenticationToken
            API.sharedInstance.authenticate()
//            NETWORKER.sharedInstance.postAJAX(url: "/auth/tokens", data: ["facebook_access_token": token.authenticationToken], callback: {(error, data) in
//                if error == nil {
//                    guard let accessToken = data["access_token"] as? String else {
//                        return
//                    }
//                    Local.sharedInstance.setStringValue(key: "accessToken", value: accessToken)
//                    self.saveDevice()
//
//                }else {
//                    debugPrint("error", error?.localizedDescription ?? "")
//                }
//            })
        }
    }

    func saveDevice () {
//        - device_type - тип устройсва. Обязательный параметр, один из ('tablet’, 'phone’, ‘pc’)
//        - vendor - производитель устройства. Например: 'LG’, 'Samsung’, ‘Apple’
//        - model - модель устройстав
//        - serial - серийный номер устройства
//        - version - версия ПО на устройстве

        var params = [String: Any]()
        params["device_type"] = "phone"
        params["vendor"] = "apple"
        params["model"] = UIDevice.current.modelName
        params["serial"] = UIDevice.current.identifierForVendor?.uuidString
        params["token"] = ["token": Local.sharedInstance.getStringValue(key: "pushToken")]



        if let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String {
            params["version"] = version
        }

        if Local.sharedInstance.getStringValue(key: "pushToken") != nil {
            params["pushToken"] = Local.sharedInstance.getStringValue(key: "pushToken")
        }


//        NETWORKER.sharedInstance.postAJAX(url: "/users/self/devices", data: params, callback: {(error, data) in
//            if error == nil {
//                guard let id = data["id"] as? String else {
//                    return
//                }
//                debugPrint("+++", data)
//                Local.sharedInstance.setStringValue(key: "deviceId", value: id)
//                AchievementFactory.sharedInstance.fetch()
//                UserFactory.sharedInstance.fetch()
//                DispatchQueue.main.async {
//                    self.parent?.performSegue(withIdentifier: "main_segue", sender: self)
//                }
//
//            }else {
//                debugPrint("error", error?.localizedDescription ?? "")
//            }
//        })
    }



    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        self.performSegue(withIdentifier: "register_segue", sender: self)
    }



//    @objc func loginButtonClicked() {
//        let loginManager = LoginManager()
//        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
//            switch loginResult {
//                case .failed(let error):
//                    print(error)
//                    self.label.text = "error"
//                case .cancelled:
//                    self.label.text = "User cancelled login."
//                    print("User cancelled login.")
//                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
//                    self.label.text = "Logged in!"
//                    print("Logged in!")
//            }
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }




}

public extension UIDevice {

    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
//        switch identifier {
//        case "iPod5,1":                                 return "iPod Touch 5"
//        case "iPod7,1":                                 return "iPod Touch 6"
//        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
//        case "iPhone4,1":                               return "iPhone 4s"
//        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
//        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
//        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
//        case "iPhone7,2":                               return "iPhone 6"
//        case "iPhone7,1":                               return "iPhone 6 Plus"
//        case "iPhone8,1":                               return "iPhone 6s"
//        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
//        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
//        case "i386", "x86_64":                          return "Simulator"
//        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
//        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
//        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
//        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
//        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
//        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
//        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
//        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
//        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
//        case "iPad6,7", "iPad6,8":                      return "iPad Pro"
//        case "AppleTV5,3":                              return "Apple TV"
//        case "i386", "x86_64":                          return "Simulator"
//        default:                                        return identifier
//        }
    }
}


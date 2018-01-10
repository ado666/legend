//
//  Navigator.swift
//  legend
//
//  Created by Boris Kuznetsov on 06/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class Navigator: UINavigationController {
    
    var contoller: UIAlertController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Errors
    func showError (label: String, description: String) {
        let myAlert = UIAlertController(title: label, message: description, preferredStyle: UIAlertControllerStyle.alert)
        self.contoller = myAlert
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(myAlert, animated: true, completion: nil)
        }
    }
    
    func hideError() {
        guard let control = self.contoller else {
            return
        }
        DispatchQueue.main.async {
            control.dismiss(animated: false, completion: nil)
        }
        
    }
    
    // MARK: - FB Auth
    func showFacebookLogin(){
        self.performSegue(withIdentifier: "facebook_login_segue", sender: self)
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         self.hideError()
    }

}

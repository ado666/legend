//
//  UserMainView.swift
//  legend
//
//  Created by Boris Kuznetsov on 22/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class UserMainView: UIViewController {

    var selected: UserStruct!

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var email: UILabel!

    @IBOutlet weak var grantButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.setNavigationBarHidden(false, animated: true)

        DispatchQueue.main.async {
            self.username.text = ""
            self.firstName.text = ""
            self.lastName.text = ""
            self.phone.text = ""
            self.email.text = ""

//            self.username.text = self.selected.username
//            self.firstName.text = self.selected.firstName
//            self.lastName.text = self.selected.lastName
//            self.phone.text = self.selected.phone
//            self.email.text = self.selected.email
        }
    }

    @IBAction func doGrant(_ sender: Any) {
        self.performSegue(withIdentifier: "show_select_segue", sender: self)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


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

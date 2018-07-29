//
//  TabController.swift
//  legend
//
//  Created by Борис Кузнецов on 29/01/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import UIKit

class TabController: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var menu_button: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menu_button.target = self.revealViewController()
            
            menu_button.action = #selector(menu_button.target?.revealToggle(_:))
        }
        
//        let logoView = UIImageView(image: UIImage(named: "image/logo/logo_small.png"))
//        var f = logoView.frame
//        f.size.width = 50
//        logoView.frame = f
//        logoView.contentMode = .scaleToFill
//        self.navigationItem.titleView = logoView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func on_menu_button(_ sender: Any) {
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

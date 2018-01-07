//
//  MainController.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class MainController: UITabBarController, UITabBarControllerDelegate {

    @IBOutlet weak var bar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.bar.barTintColor = #colorLiteral(red: 0.9176470588, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
//        self.bar.tintColor = #colorLiteral(red: 0.1568627451, green: 0.2117647059, blue: 0.2470588235, alpha: 1)
        self.bar.clipsToBounds = true
//        self.tabBar.it
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.1568627451, green: 0.2117647059, blue: 0.2470588235, alpha: 0.35)

        self.tabBar.selectionIndicatorImage = UIImage()
        self.tabBar.tintColor = #colorLiteral(red: 0.1568627451, green: 0.2117647059, blue: 0.2470588235, alpha: 1)
//        self.tabBar.unselectedItemTintColor = UIColor.white

//        self.bar.tintColor = #colorLiteral(red: 0.9843137255, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
//        self.bar.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
//        self.navigationController?.isNavigationBarHidden = true


        // Do any additional setup after loading the view.
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


extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 50)
    }
}

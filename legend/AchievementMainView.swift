//
//  AchievementMainView.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class AchievementMainView: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var selected: AchievementStruct!

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.setNavigationBarHidden(false, animated: true)

        self.titleLabel.text = self.selected.title
        self.descriptionLabel.text = self.selected.description

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

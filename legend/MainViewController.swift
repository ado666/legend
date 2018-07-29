//
//  MainViewController.swift
//  legend
//
//  Created by Борис Кузнецов on 01/02/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var topVIew: UIView!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var firstNameView: UILabel!
    @IBOutlet weak var lastNameView: UILabel!
    
    @IBOutlet weak var nicknameView: UILabel!
    
    @IBOutlet weak var achievementsView: UIView!
    @IBOutlet weak var achievementsCollectionView: UICollectionView!
    
    var achievementsCollectionController: AchievementsGridController! = AchievementsGridController()
    
    @IBOutlet weak var createAchevementButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.achievementsCollectionView.delegate = achievementsCollectionController
        self.achievementsCollectionView.dataSource = achievementsCollectionController
        
        API.sharedInstance.getUser(completion: {(data, code, error) in
            let user = UserFactory.sharedInstance.SELF
            
            _ = IMAGELOADER.sharedInstance.getImage(user?.avatar, callback: {(error, image) in
                self.avatarView.image = image
            })
            self.nicknameView.text = String(format: "@%@", (user?.username)!)
            self.firstNameView.text = user?.firstName
            self.lastNameView.text = user?.lastName
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func _on_create_Achevement(_ sender: Any) {
        self.revealViewController().revealToggle(self)
        (UIApplication.shared.delegate as! AppDelegate).navigator.performSegue(withIdentifier: "create_achievement_segue", sender: nil)
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

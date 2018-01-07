//
//  ListMainViewController.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class ListMainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!

    let itemIdent = "list_item_view"
    var selectedCell: AchievementStruct!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)

        NotificationCenter.default.addObserver(self, selector: #selector(self.achievementsFetched), name: NSNotification.Name(rawValue: "fetchAchievements"), object: nil)
    }

    func achievementsFetched () {
        DispatchQueue.main.async {
            self.collection.reloadData()
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collection.frame.width - 20.0, height: 100.0)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.itemIdent,
                                                      for: indexPath) as! ListMainCellView)
//        cell.backgroundColor = UIColor.black
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 5.0
        cell.layer.borderWidth = 2

        let data = AchievementFactory.sharedInstance.collection[indexPath.item]

        if data.ico != nil {
            _ = IMAGELOADER.sharedInstance.getImage(data.ico, callback: {(error, img) in
                DispatchQueue.main.async {
                    cell.image.image = img
                }
            })
        }else {
            cell.image.image = nil
        }

        cell.title.text = data.title

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.selectedCell = AchievementFactory.sharedInstance.collection[indexPath.item]
//        self.performSegue(withIdentifier: "show_achiev_segue", sender: self)
//    }

    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AchievementFactory.sharedInstance.collection.count
    }
    @IBAction func doDisconnect(_ sender: Any) {
        NETWORKER.sharedInstance.deleteAjax(url: "/users/self/devices/" + Local.sharedInstance.getStringValue(key: "deviceId"), data: [String: String](), callback: {(error, data) in

        })
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_achiev_segue" {
            let destination = segue.destination as! AchievementMainView

            if self.selectedCell != nil {
                destination.selected = self.selectedCell
            }
        }
    }


}

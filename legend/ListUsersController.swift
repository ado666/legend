//
//  ListUsersController.swift
//  legend
//
//  Created by Boris Kuznetsov on 22/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class ListUsersController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!

    let itemIdent = "user_item_view"
    var selectedCell: UserStruct!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        NotificationCenter.default.addObserver(self, selector: #selector(self.usersFetched), name: NSNotification.Name(rawValue: "fetchUsers"), object: nil)
    }

//    override func viewDidDisappear(_ animated: Bool) {
////        (UIApplication.shared.keyWindow?.rootViewController as! Navigator).setNavigationBarHidden(true, animated: true)
//        super.viewWillDisappear(animated)
//    }

    func usersFetched () {
        DispatchQueue.main.async {
            self.collection.reloadData()
        }

    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collection.frame.width - 20.0, height: 100.0)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: self.itemIdent,
                                                       for: indexPath) as! ListUserCellView)
        //        cell.backgroundColor = UIColor.black
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 5.0
        cell.layer.borderWidth = 2

        let data = UserFactory.sharedInstance.collection[indexPath.item]

//        if data.ico != nil {
//            _ = IMAGELOADER.sharedInstance.getImage(data.ico, callback: {(error, img) in
//                DispatchQueue.main.async {
//                    cell.image.image = img
//                }
//            })
//        }else {
//            cell.image.image = nil
//        }

        cell.username.text = data.username

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.selectedCell = UserFactory.sharedInstance.collection[indexPath.item]
//        self.performSegue(withIdentifier: "show_user_segue", sender: self)
//    }

    //2
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserFactory.sharedInstance.collection.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show_user_segue" {
            let destination = segue.destination as! UserMainView

            if self.selectedCell != nil {
                destination.selected = self.selectedCell
            }
        }
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

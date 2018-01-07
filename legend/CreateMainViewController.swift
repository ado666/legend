//
//  CreateMainViewController.swift
//  legend
//
//  Created by Boris Kuznetsov on 19/08/2017.
//  Copyright © 2017 Boris Kuznetsov. All rights reserved.
//

import UIKit

class CreateMainViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var imageInput: UIImageView!

    @IBOutlet weak var createButton: UIButton!

    let imagePicker = UIImagePickerController()

    var viewTap: UITapGestureRecognizer!
    var imageTap: UITapGestureRecognizer!

    var imagePicked: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.isNavigationBarHidden = true

        self.imagePicker.delegate = self

        self.viewTap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(self.viewTap)

        self.imageTap = UITapGestureRecognizer(target: self, action: #selector(self.pickupImage))
        self.imageInput.addGestureRecognizer(self.imageTap)
    }

    func dismissKeyboard () {
        DispatchQueue.main.async {
            self.view.endEditing(true)
        }
    }

    func pickupImage () {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary

        self.present(self.imagePicker, animated: true, completion: nil)
    }


    @IBAction func doCreate(_ sender: Any) {
        let title = nameInput.text
        let description = descriptionInput.text
        let imageData: Data = UIImagePNGRepresentation(self.imageInput.image!)!

        let imageString = imageData.base64EncodedString(options: .endLineWithLineFeed)

        var params = [String: String]()
        params["title"] = title
        params["description"] = description

        if self.imagePicked {
            params["image"] = "data:image/png;base64," + imageString
        }


        if title == "" || description == "" {return}

        NETWORKER.sharedInstance.postAJAX(url: "/achievements", data: params, callback: {(error, data) in
            if error == nil {

                DispatchQueue.main.async {
                    self.nameInput.text = ""
                    self.descriptionInput.text = ""
                    self.imageInput.image = UIImage(named: "image/image-placeholder.jpg")
                }
                self.imagePicked = false
                AchievementFactory.sharedInstance.fetch()
                self.dismissKeyboard()
            }
        })
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

//        self.nameInput.text = ""
//        self.descriptionInput.text = ""
//        self.imageInput.image = UIImage(named: "image/image-placeholder.jpg")
//        self.imagePicked = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UIImagePickerControllerDelegate Methods

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageInput.contentMode = .scaleAspectFit
            self.imageInput.image = pickedImage
            self.imagePicked = true
        }

        dismiss(animated: true, completion: nil)
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

//
//  CreateController.swift
//  legend
//
//  Created by Борис Кузнецов on 06/02/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import UIKit
import WebKit
//import SwiftSVG


class CreateController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var descInput: UITextField!
    @IBOutlet weak var iconsCollection: UICollectionView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var testview: UIView!
    
    var iconsData : [IconStruct]! = [IconStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let svgURL = URL(
//            string: "https://openclipart.org/download/181651/manhammock.svg"
////            string: "http://lgnd.im/media/ico/svg/1c/99/1c994f0ca1b962af8b4d30f266e3e209.svg"
//        )!
        
        
//        let svg = UIView(SVGURL: svgURL) { (svgLayer) in
//            DispatchQueue.main.async {
////                                svgLayer.resimzeToFit(self.testview.bounds)
////                svgLayer.draw(in: self.cont)
//                //                self.view.layer.addSublayer(svgLayer)
//            }
//
//        }
//        let svg = UIView(pathString: "M197.584 23.28c-18.284.166-34.4 4.378-48.488 12.285C120.92 51.38 102.008 80.7 87.62 117.445c-.637 1.623-1.254 3.282-1.874 4.936a433.13 433.13 0 0 0 16.73 6.654c.628-1.69 1.26-3.378 1.905-5.028 13.612-34.757 30.7-59.935 53.524-72.746 11.413-6.405 24.546-10.037 40.137-10.136 15.592-.1 33.64 3.335 54.884 11.06L256 53.3l3.076-1.116c42.486-15.45 72.195-13.735 95.02-.924 22.824 12.81 39.912 37.99 53.523 72.746.645 1.65 1.276 3.338 1.905 5.028c-.62-1.653-1.238-3.312-1.874-4.936-14.388-36.743-33.3-66.065-61.476-81.88C335.38 20.117 300.046 18.895 256 34.27c-21.502-7.506-40.977-11.15-58.416-10.99z")
//        self.testview.addSubview(svg)

        IconFactory.sharedInstance.getAll(completition: {(data) in
            self.iconsData = data
            DispatchQueue.main.async {
                self.iconsCollection.reloadData()
            }
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.iconsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "select_icon_cell",
            for: indexPath) as! SelectIconCell
        
        
        
        cell.showSVG(url: self.iconsData[indexPath.item].url)
        
        
        debugPrint(indexPath.item, self.iconsData[indexPath.item].url)
//        if cell.webView == nil {
//            var frame = cell.frame
//            frame.origin.x = 0
//            frame.origin.y = 0
//            frame.size.width = 80
//            frame.size.height = 80
//
//            cell.webView = WKWebView(frame: frame)
//            cell.webView.contentMode = .scaleAspectFill
////            cell.webView.isUserInteractionEnabled = false
//            cell.addSubview((cell.webView)!)
//        }
//
//
//        let url = URL(string: self.iconsData[indexPath.item].url)
//        let requestObj = URLRequest(url: url!)
//        cell.webView.load(requestObj)
        
    
        
//        var path: String = NSBundle.mainBundle().pathForResource("nameOfFile", ofType: "svg")!
        
//        print(Bundle.main.url(forResource: "avatar", withExtension: ".png"))
//        let url = URL.init(fileURLWithPath: self.iconsData[indexPath.item].url)
//        var url: NSURL = NSURL.fileURL(withPath: self.iconsData[indexPath.item].url) as NSURL  //Creating a URL which points towards our path
        
//        webView.loadRequest(request)
//        cell?.webView.loadFileURL(url, allowingReadAccessTo: url)

//        let url = URL(string: self.iconsData[indexPath.item].url)
//        cell?.webView.loadHTMLString(html, baseURL: Bundle.main.bundleURL)
//        debugPrint(url)
//        cell?.webView.loadFileURL(url!, allowingReadAccessTo: url!)
        
//        let path = Bundle.main.path(forResource: self.iconsData[indexPath.item].url, ofType: "svg")!
//        if path != "" {
//            let fileURL:URL = URL(fileURLWithPath: path)
//            let req = URLRequest(url: fileURL)
////            cell?.webView.scalesPageToFit = false
//            cell?.webView.load(req)
//        }
//        else {
//            //handle here if path not found
//        }
        
//        IMAGELOADER.sharedInstance.getImage(self.iconsData[indexPath.item].url, callback: {(error, image) in
//            DispatchQueue.main.async {
//
//
//            }
//        })
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

//
//  SelectIconCell.swift
//  legend
//
//  Created by Борис Кузнецов on 06/02/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import UIKit
import WebKit
import SVGKit

class SelectIconCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    override func prepareForReuse() {
//        self.view.layer.sublayers?.forEach({ $0.removeFromSuperlayer() })
//        self.view.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    func showSVG (url: String) -> Void {
        
        let image = SVGKImage.init(contentsOf: URL(string: url))
//        let svgURL = URL(
//            string: url
////            string: "http://lgnd.im/media/ico/svg/1c/99/1c994f0ca1b962af8b4d30f266e3e209.svg"
//        )!
        

//        let svg = UIView(SVGURL: svgURL) { (svgLayer) in
//            DispatchQueue.main.async {
////                svgLayer.resizeToFit(self.view.bounds)
////                self.view.layer.addSublayer(svgLayer)
//            }
//            
//        }
        
        image?.scaleToFit(inside: CGSize(width: 80, height: 80))
        debugPrint(image?.uiImage)
        self.image.image = image?.uiImage
        
        
        
    }
}

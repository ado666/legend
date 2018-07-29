//
//  SWControll.swift
//  legend
//
//  Created by Борис Кузнецов on 28/01/2018.
//  Copyright © 2018 Boris Kuznetsov. All rights reserved.
//

import UIKit

class SWControll: SWRevealViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sw_front" {
            (UIApplication.shared.delegate as! AppDelegate).navigator = segue.destination as! Navigator
        }
    }
}

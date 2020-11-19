//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by n on 13/03/2020.
//  Copyright © 2020 n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func NextBtn(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true, completion: nil)
    }
    
    
    
}


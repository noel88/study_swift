//
//  ViewController.swift
//  Scene-Trans02
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


    
    @IBAction func moveByNavy(_ sender: Any) {
        
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC1") else {
            return
        }
        
        uvc.navigationController?.pushViewController(uvc, animated: true)
    }
    
    @IBAction func movePreksent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC1") else {
            return
        }
        
        self.present(uvc, animated: true, completion: nil)
    }
    
    
}


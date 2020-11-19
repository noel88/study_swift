//
//  ViewController.swift
//  IBTest
//
//  Created by n on 12/03/2020.
//  Copyright © 2020 n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uiTitle01: UILabel!
    @IBOutlet weak var uiTitle02: UILabel!
    @IBOutlet weak var uiTitle03: UILabel!
    @IBOutlet weak var uiTitle04: UILabel!
    @IBOutlet weak var uiTitle05: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func clickBtn01(_ sender: Any) {
        self.uiTitle01.text = "01 click"
        
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "02 click"
    }
    
    @IBAction func clickBtn03(_ sender: Any) {
        self.uiTitle03.text = "03 click"
    }
    
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "04 click"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "05 click"
    }
    
}


//
//  ViewController.swift
//  SubmitVaule
//
//  Created by n on 18/03/2020.
//  Copyright © 2020 n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
    
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "RVC") as? ResultViewController else {
            return
        }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        self.present(rvc, animated: true, completion: nil)
    }
    
    
}


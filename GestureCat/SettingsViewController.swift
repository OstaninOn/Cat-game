//
//  SettingsViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 20.11.22.
//

import UIKit

class SettingsViewController: UIViewController {
   
    var lightOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func colorSwitch(_ sender: UISwitch) {
        lightOn = !lightOn
        if lightOn {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
        
    }
    
}

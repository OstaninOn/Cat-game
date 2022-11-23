//
//  SettingsViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 20.11.22.
//

import UIKit

class SettingsViewController: UIViewController {
  
    @IBOutlet weak var switchThema: UISwitch!
    
    @IBOutlet weak var lbl: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        
        if let userDefaultValue = UserDefaults.standard.getValueOfSwitch(), userDefaultValue {
            switchThema.setOn (true, animated: false)
            lbl.text = "Light mode"
        } else {
            switchThema.setOn (false, animated: true)
            lbl.text = "Dark mode"
        }
    }

    @IBAction func onClickSwitch(_ sender: UISwitch) {

        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn {
                appDelegate?.overrideUserInterfaceStyle = .light
                UserDefaults.standard.setValueForSwitch(value: true)
                lbl.text = "Light mode"
                return
                } else {
                appDelegate?.overrideUserInterfaceStyle = .dark
                UserDefaults.standard.setValueForSwitch(value: false)
                    lbl.text = "Dark mode"
                return
            }
            
        }
     
    }
    
}

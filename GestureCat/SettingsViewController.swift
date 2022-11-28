//
//  SettingsViewController.swift
//  GestureCat
//
//  Created by  aleksandr on 20.11.22.
//

import UIKit
import MessageUI
import AVFoundation

class SettingsViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var volumeSliderMusicFirst: UISlider!
    
    @IBOutlet weak var volumeSliderSoundsFirst: UISlider!
    
    @IBOutlet weak var switshSouns: UISwitch!
    
    @IBOutlet weak var switchMusic: UISwitch!
    
    @IBOutlet weak var switchThema: UISwitch!
    
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let isOn = UserDefaults.standard.switchIsOn
        titleMusic(isOn: isOn)
        titleSouns(isOn: isOn)
        
        if let userDefaultValue = UserDefaults.standard.getValueOfSwitch(), userDefaultValue {
            switchThema.setOn (true, animated: false)
            lbl.text = "Light mode"
        } else {
            switchThema.setOn (false, animated: true)
            lbl.text = "Dark mode"
        }
    }
    
    @IBAction func onClickSwitch(_ sender: UISwitch) {
        if #available(iOS 15.0, *) {
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
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: "обраная связь", preferredStyle: .actionSheet)
        
        let gramBtn = UIAlertAction(title: "Telegram", style: .default, handler: { action in
            guard let telegramLink = URL(string: "https://t.me/Aleksandr_Ostanin") else {
                return
            }
            UIApplication.shared.open(telegramLink)
        })
        
        let emlBtn = UIAlertAction(title: "Email", style: .default, handler: { action in
            if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["berezko88@mail.ru"])
                mail.setSubject("Feedback")
                mail.setMessageBody("<p>halo!</p>", isHTML: true)
                mail.setCcRecipients([""])
                
                self.present(mail, animated: true)
            } else {
            }
        })
        
        let cencelBtn = UIAlertAction(title: "Cencel", style: .destructive, handler: nil)
        alert.addAction(gramBtn)
        alert.addAction(emlBtn)
        alert.addAction(cencelBtn)
        
        present(alert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    
    @IBAction func soundsAction(_ sender: UISwitch) {
        titleSouns(isOn: sender.isOn)
   
        if sender.isOn {

            MusicSound.sharedSound.playMusicSound()
            UserDefaults.standard.switchIsOn = sender.isOn
            return
        } else {
            MusicSound.sharedSound.audioPlayer?.stop()
            UserDefaults.standard.switchIsOn = sender.isOn
    }
}
     private func titleSouns(isOn: Bool) {
        switshSouns.isOn = isOn
    }
    
    
    @IBAction func musicAction(_ sender: UISwitch) {
        
        titleMusic(isOn: sender.isOn)
        if sender.isOn {
            MusicHelper.sharedHelper.playBackgroundMusic()
            UserDefaults.standard.switchIsOn = sender.isOn
            return
    } else {
         MusicHelper.sharedHelper.audioPlayer?.stop()
        UserDefaults.standard.switchIsOn = sender.isOn
        return
    }
}
    
    
    private func titleMusic(isOn: Bool) {
        switchMusic.isOn = isOn
    }
    
    
    @IBAction func volumeSliderSoundsSecond(_ sender: UISlider) {
        MusicSound.sharedSound.audioPlayer?.volume = volumeSliderSoundsFirst.value
    }
    
    @IBAction func volumeSliderMusic(_ sender: UISlider) {
        MusicHelper.sharedHelper.audioPlayer?.volume = volumeSliderMusicFirst.value
        
    }
}

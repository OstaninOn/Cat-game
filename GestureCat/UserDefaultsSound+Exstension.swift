//
//  UserDefaultsSound+Exstension.swift
//  GestureCat
//
//  Created by  aleksandr on 25.11.22.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case switchIsOn
    }
    
    var switchIsOn: Bool {
        get {
            UserDefaults.standard.bool(forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
        
        set {
            UserDefaults.standard.setValue(newValue, forKey: UserDefaultsKeys.switchIsOn.rawValue)
        }
    }
}

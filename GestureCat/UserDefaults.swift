


import Foundation

extension UserDefaults {
    func setValueForSwitch(value: Bool?) {
        if value != nil {
            UserDefaults.standard.set(value, forKey: "Switch_State")
        } else {
            UserDefaults.standard.removeObject(forKey: "Switch_State")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getValueOfSwitch () -> Bool? {
        return UserDefaults.standard.value(forKey: "Switch_State") as? Bool
    }
}

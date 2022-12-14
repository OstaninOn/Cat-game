//
//  StoreManager.swift
//  GestureCat
//
//  Created by Yury Vozleev on 14.11.2022.
//

import Foundation

class StoreManager {
    
    // MARK: - Singletone
    static var shared = StoreManager()
    
    private init() { }
    
    // MARK: - Public properties
    var hasDefaultValues: Bool {
        get {
            storage.bool(forKey: "hasDefaultValues")
        }
        
        set {
            storage.set(newValue, forKey: "hasDefaultValues")
        }
    }
  
    var name: String{
        get{
            storage.string(forKey: "name") ?? ""
        }
        set{
            storage.set(newValue, forKey: "name")
        }
    }
    
    var scores: [ScoreModel] {
        get {
            guard let data = storage.value(forKey: "scores") as? Data,
                  let scores = try? JSONDecoder().decode([ScoreModel].self, from: data) else {
                    return []
            }
            
            return scores
        }
        
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "scores")
            }
        }
    }
    
    // MARK: - Private properties
    let storage = UserDefaults.standard
}

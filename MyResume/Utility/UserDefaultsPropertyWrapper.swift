//
//  UserDefaultsPropertyWrapper.swift
//  MyResume
//
//  Created by Артём Тюрморезов on 09.08.2023.
//

import Foundation

@propertyWrapper
struct UserDefaultsStorage <Value: Codable> {
    let key: String = "Mydata"
    let userDefaults = UserDefaults.standard
    let defaultValue: Value
    
    var wrappedValue: Value {
        get {
            let data = userDefaults.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        } set {
            let data = try? JSONEncoder().encode(newValue)
            userDefaults.set(data, forKey: key)
            userDefaults.synchronize()
        }
    }
    
}

//
//  Configurations.swift
//  Pensamentos
//
//  Created by Jhenifer Dias on 06/11/22.
//

import Foundation
import UIKit

enum UserDefaultKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}


class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.timeInterval.rawValue)
        }
    }
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultKeys.colorScheme.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.colorScheme.rawValue)
        }
    }
    
    var autorefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultKeys.autorefresh.rawValue)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultKeys.autorefresh.rawValue)
        }
    }
    private init(){
        if defaults.double(forKey: UserDefaultKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDefaultKeys.timeInterval.rawValue)
    }
    }
    
}

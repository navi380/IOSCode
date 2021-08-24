//
//  UserDefaults.swift
//  FirstApp
//
//  Created by Navi on 7/28/21.
//

import Foundation


enum UserDefaultsKeys : String {
    case isLoggedIn
    case userID
}

extension UserDefaults{

    //MARK: Check Login
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsKeys.isLoggedIn.rawValue)
        synchronize()
    }

    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsKeys.isLoggedIn.rawValue)
    }

    
}

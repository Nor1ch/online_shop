//
//  UserModel.swift
//  online_shop
//
//  Created by Nor1 on 16.03.2023.
//

import Foundation
import UIKit

struct UserModel {
    let name: String
    let last_name: String
    let email: String
    let password = "12345"
    let image: UIImage?
}

class UDUser {
    
    enum Key {
        static let name = "Name"
        static let last_name = "Last name"
        static let email = "Email"
        static let image_data = "Image data"
    }
    
    static func saveUser(name:String, last_name: String, email: String){
        UserDefaults.standard.set(name, forKey: Key.name)
        UserDefaults.standard.set(last_name, forKey: Key.last_name)
        UserDefaults.standard.set(email, forKey: Key.email)
    }
    static func loadUser() -> UserModel?{
        if let name = UserDefaults.standard.string(forKey: Key.name), let last_name = UserDefaults.standard.string(forKey: Key.last_name), let email = UserDefaults.standard.string(forKey: Key.email){
            return UserModel(name: name, last_name: last_name, email: email, image: nil)
        }
        return nil
    }
    static func saveImage(image_data: Data) {
        UserDefaults.standard.set(image_data, forKey: Key.image_data)
    }
}

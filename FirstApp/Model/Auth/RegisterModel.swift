//
//  RegisterModel.swift
//  FirstApp
//
//  Created by Navi on 7/24/21.
//

import Foundation


struct RegisterModel : Encodable {
    let name : String
    let email : String
    let password : String
}

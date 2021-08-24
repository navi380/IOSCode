//
//  PostModel.swift
//  FirstApp
//
//  Created by Navi on 7/29/21.
//

import Foundation
//codable for json serilization
struct Postmodel: Codable,Equatable {
    let id: Int
    let title: String
    let body: String
}

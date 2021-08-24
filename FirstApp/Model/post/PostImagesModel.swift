//
//  PostImagesModel.swift
//  FirstApp
//
//  Created by Navi on 7/30/21.
//

import Foundation




struct PostUserProfileImage: Codable {
  let medium: String
}

struct PostUser: Codable {
  let profile_image: PostUserProfileImage
}

struct PostUrls: Codable {
  let regular: String
}

struct PostImagesModel: Codable {
  let id: String
  let description: String?
  let user: PostUser
  let urls: PostUrls
}

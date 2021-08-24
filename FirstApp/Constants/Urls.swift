//
//  Urls.swift
//  FirstApp
//
//  Created by Navi on 7/24/21.
//

import Foundation

let accessKey = "bbc33cc9f86e189e1387e31a57dbd74a2dba4a5f4540f7a0dbcb599fd72f61f2"

let app_id = "BCCBD517-66D2-B8B8-FF94-DFD4A803A100"
let rest_key = "6158D62C-F866-423F-BFEC-07683A0FB19E"
let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"

let registr_url = "\(base_url)register"
let login_url = "\(base_url)login"


//different urls will be stored here so it will easy to change them all
let postUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")
  
let postSingle = URL(string: "https://jsonplaceholder.typicode.com/posts/1")

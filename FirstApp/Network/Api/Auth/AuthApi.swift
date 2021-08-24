//
//  RegisterApi.swift
//  FirstApp
//
//  Created by Navi on 7/24/21.
//

import Foundation
import Alamofire

class AuthApi {
    
    static var shared = AuthApi()
    private init() {}
    
    func RegisterUser(register: RegisterModel, completionHandler: @escaping (Bool, String) -> ()){
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(registr_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                    if response.response?.statusCode == 200{
                        completionHandler(true, "User Registerd Successfully")
                    }
                    else{
                        //let message = (json as AnyObject).value(forKey: "message") as! String
                        let message = json?["message"] as! String
                        completionHandler(false, message)
                    }
                    
                } catch  {
                    print(error.localizedDescription)
                    completionHandler(false, error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false, err.localizedDescription)
            }
        }
    }
        
        func loginUser(login: LoginModel, completionHandler: @escaping (Bool, String) -> ()){
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            AF.request(login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response { response in
                debugPrint(response)
                switch response.result{
                case .success(let data):
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
                        if response.response?.statusCode == 200{
                            completionHandler(true, "User logedIn Successfully")
                        }
                        else{
                            //let message = (json as AnyObject).value(forKey: "message") as! String
                            let message = json?["message"] as! String
                            completionHandler(false, message)
                        }
                        
                    } catch  {
                        print(error.localizedDescription)
                        completionHandler(false, error.localizedDescription)
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    completionHandler(false, err.localizedDescription)
                }
            }
        
    }
    
}


//
//  PostNetworkCall.swift
//  FirstApp
//
//  Created by Navi on 7/29/21.
//

import Foundation

protocol postApiProtocol {
    func getPostList(completionHandler: @escaping ([Postmodel]) -> Void)
    //10 apis
    //api protocol
}

class postApiService: postApiProtocol{
    //10 implementation
    //api protocol ki implementation
    private init(){}
    static let shared = postApiService()
    
    func getPostList(completionHandler: @escaping ([Postmodel]) -> Void){
        let task = URLSession.shared.dataTask(with: postUrl!) { data, response, error in
            if error != nil || data == nil {
                    print("Client error!")
                    return
                }
            //checking if the reponse is valid
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                    print("Server error!")
                    return
                }
            guard let mime = response.mimeType, mime == "application/json" else {
                   print("Wrong MIME type!")
                   return
               }
            //do catch is more like if else here do is storing data in a variable and catch is checking errors
            do {
                let json = JSONDecoder()
                let postData = try json.decode([Postmodel].self, from: data!)
                completionHandler(postData)
               } catch {
                   print("JSON error: \(error.localizedDescription)")
               }

        }
        task.resume()
    }


}

//THIS IS A VIEW MODEL USE FOR MVVM PATTERN
class PostApiNetworkManager{
    var myProtocol : postApiProtocol?
    
    var posts = Observable<[Postmodel]>()
    
    init(protocolArgument : postApiProtocol){
        myProtocol  = protocolArgument
    }
    
    func getPostList() {
        myProtocol?.getPostList(completionHandler: { model in
            self.posts.property = model
        })
}

//        models.append(Postmodel(id: 0, title: "Uzair", body: "My name is khaan and im not a terrorist"))
        
    }


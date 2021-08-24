//
//  postDataViewModel.swift
//  FirstApp
//
//  Created by Navi on 8/1/21.
//

import Foundation



class postDataViewModelVideo {
    
    var postData = [Postmodel]()

//    weak var vc: HomeViewController?
    
    //for injecting the protocol services here
    var myProtocol : postApiProtocol?
    init(protocolArgument : postApiProtocol){
        myProtocol  = protocolArgument
    }
    
    func getPostListData(completion: @escaping (([Postmodel]) -> Void)) {
        myProtocol?.getPostList(completionHandler: { posts in
            self.postData = posts
            completion(self.postData)
        })
    }
    
    
    
//    func callin()  {
//        myProtocol?.getPostList(completionHandler: { posts in
//            self.vc?.postData = posts
//            DispatchQueue.main.async {
//                self.vc?.postTableView.reloadData()
//                       }
//        })
//    }
    
    
}

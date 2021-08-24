//
//  DependencyInjection.swift
//  FirstApp
//
//  Created by Navi on 7/31/21.
//

import Foundation
/**
       This class figures out that what are the dependencies needed by different classes and providing those dependecies
 */
class Injection{
    static let provide = Injection()
    

    func postApiProtocol() -> PostApiNetworkManager{
        return PostApiNetworkManager(protocolArgument: postApiService.shared)
    }
    
    func postApiProtocolUsingVideo() -> postDataViewModelVideo{
        return postDataViewModelVideo(protocolArgument: postApiService.shared)
    }
  
}

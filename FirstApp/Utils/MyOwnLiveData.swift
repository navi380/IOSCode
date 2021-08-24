//
//  MyOwnLiveData.swift
//  FirstApp
//
//  Created by Navi on 7/31/21.
//

import Foundation


class Observable<T: Equatable> {
  private let thread : DispatchQueue
  var property : T? {
    willSet(newValue) {
      if let newValue = newValue,  property != newValue {
          thread.async {
            self.observe?(newValue)
          }
      }
   }
  }
 var observe : ((T) -> ())?
 init(_ value: T? = nil, thread dispatcherThread: DispatchQueue =     DispatchQueue.main) {
    self.thread = dispatcherThread
    self.property = value
 }
}

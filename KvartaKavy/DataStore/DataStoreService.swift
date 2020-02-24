//
//  DataStoreService.swift
//  KvartaKavy
//
//  Created by dewill on 20.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
//
//class DataStoreService {
//    
//    private let localStore: LocalDataStore
//    private let remoteStore: RemoteDataStore
//    
//    private init(){
//        self.localStore = LocalDataStore()
//        self.remoteStore = RemoteDataStore()
//    }
//    
//    static let shared = DataStoreService()
//    
//    
//    func getArticles(completion: @escaping ([ArticleLocal]) -> Void) {
//        remoteStore.getFromRemoteDataStore(){ [weak self] result in
//              switch result {
//              case .failure(let failure): self?.onFailure(error: failure, completion: completion)
//              case .success(let response): self?.onSuccess(response: response, completion: completion)
//              }
//          }
//      }
//    
//    private func onSuccess(response: [ArticleRemote], completion:@escaping ([ArticleLocal]) -> Void) {
//        localStore.deleteAllObject()
//        localStore.add(remote: response, completion: completion)
//    }
//    
//    private func onFailure(error: Error, completion: @escaping ([ArticleLocal]) -> Void) {
//        print("DataStoreService \(#function) \(error.localizedDescription)")
//        localStore.get(completion: completion)
//    }
//    
//}

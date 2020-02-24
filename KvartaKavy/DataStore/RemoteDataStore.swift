//
//  RemoteDataStore.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import FirebaseFirestore

class RemoteDataStore {
    
    private var storage: Firestore?
    private let collectionName = "article-list"
    
    
    private  init() {
        storage = Firestore.firestore()
    }
    
    static let shared = RemoteDataStore()
    
    
    
    func getFromRemoteDataStore(completion: @escaping (Result<[ArticleRemote], ApiError>) -> Void){
        guard let storage = storage else { return }
        storage.collection(collectionName).getDocuments() { [weak self] querySnapshot, error in
            if let err = error { self?.onFailure(error: err, completion: completion)
            } else {
                self?.onSuccess(querySnapshot: querySnapshot, completion: completion)
            }
        }
    }
    
    private func add(articleDictionary: [String: String]) {
        guard let storage = storage else { return }
        storage.collection(collectionName).addDocument(data: articleDictionary){
            err in
            if err != nil {
                print("DataSore -> Error adding document: \(String(describing: err))")
            }
        }
    }
    
    
    private func onFailure(error: Error, completion: @escaping (Result<[ArticleRemote], ApiError>) -> Void) {
        print("Error getting documents: \(error)")
        completion(.failure(.recieveNilBody))
    }
    
    private func onSuccess(querySnapshot: QuerySnapshot?, completion: @escaping (Result<[ArticleRemote], ApiError>) -> Void){
        var arrayList = [ArticleRemote]()
        for document in querySnapshot!.documents {
            print("DataSore -> \(document.documentID) => \(document.data())")
            guard let response = document.data() as? [String: String] else { return }
            arrayList.append(ArticleRemote(dictionary: response ))
        }
        completion(.success(arrayList))
    }
    
    
}


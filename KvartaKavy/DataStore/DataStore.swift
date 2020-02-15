//
//  DataStore.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import FirebaseFirestore

class DataSore: Storable {
    
    private init(){}
    static var shared: Storable = DataSore()
    var storage: Firestore?
    private let collectionName = "article-list"
    
    
    func add(articleDictionary: [String: String]) {
        guard let storage = storage else { return }
        storage.collection(collectionName).addDocument(data: articleDictionary){
            err in
            if err != nil {
                print("DataSore -> Error adding document: \(String(describing: err))")
            }
        }
    }
    
    func getArticles(compentition: @escaping (Result<[Article], ApiError>)-> Void){
        guard let storage = storage else { return ()}
        storage.collection(collectionName).getDocuments() { querySnapshot, error in
            if let err = error {
                print("Error getting documents: \(err)")
                compentition(.failure(.recieveNilBody))
            } else {
                var arrayList = [Article]()
                for document in querySnapshot!.documents {
                    print("DataSore -> \(document.documentID) => \(document.data())")
                    guard let response = document.data() as? [String: String] else { return }
                    arrayList.append(Article(dictionary: response ))
                }
                compentition(.success(arrayList))
            }
        }
    }
    
    
    
    
    
}


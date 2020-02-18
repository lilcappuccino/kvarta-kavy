//
//  DataStore.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import FirebaseFirestore
import RealmSwift

class DataSore {
    
    private init(){}
    static var shared: DataSore = DataSore()
    var storage: Firestore?
    private let collectionName = "article-list"
    
    //MARK:-> Remote datastore
    func add(articleDictionary: [String: String]) {
        guard let storage = storage else { return }
        storage.collection(collectionName).addDocument(data: articleDictionary){
            err in
            if err != nil {
                print("DataSore -> Error adding document: \(String(describing: err))")
            }
        }
    }
    
   private func getFromRemoteDataStore(compentition: @escaping (Result<[ArticleRemote], ApiError>) -> Void){
        guard let storage = storage else { return ()}
        storage.collection(collectionName).getDocuments() { querySnapshot, error in
            if let err = error {
                print("Error getting documents: \(err)")
                compentition(.failure(.recieveNilBody))
            } else {
                var arrayList = [ArticleRemote]()
                for document in querySnapshot!.documents {
                    print("DataSore -> \(document.documentID) => \(document.data())")
                    guard let response = document.data() as? [String: String] else { return }
                    arrayList.append(ArticleRemote(dictionary: response ))
                }
                compentition(.success(arrayList))
            }
        }
    }
    
    func getArticles(compentition: @escaping (Result<[ArticleLocal], ApiError>) -> Void) {
        getFromRemoteDataStore(){ result in
            switch result {
            case .failure(let failure): print("DataSore \(#function) \(failure.localizedDescription)")
            case .success(let response): self.add(remote: response); self.get(compentition: compentition)
            }
        }
    }
    
    
    //MARK:-> Local datasotre
    func get(compentition: @escaping (Result<[ArticleLocal], ApiError>) -> Void) {
         let realm = try! Realm()
        let object = realm.objects(ArticleLocal.self)
       
                    
    }
    
    func add(remote articles: [ArticleRemote]){
        for article in articles {
            add(remote: article)
        }
    }
    
    func add(remote article: ArticleRemote) {
        add(imageUrl: article.imageUrl, itemDescription: article.description, title: article.title, text: article.text)
    }
    
    func add(imageUrl: String, itemDescription: String, title: String, text: String){
        let realm = try! Realm()
        try! realm.write(){
            let localArticle = realm.create(ArticleLocal.self)
            localArticle.imageUrl = imageUrl
            localArticle.itemDescription = itemDescription
            localArticle.title = title
            localArticle.text = text
        }
    }
    
    
    
}


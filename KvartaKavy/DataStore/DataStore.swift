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
    
   private func getFromRemoteDataStore(completion: @escaping (Result<[ArticleRemote], ApiError>) -> Void){
        guard let storage = storage else { return }
        storage.collection(collectionName).getDocuments() { querySnapshot, error in
            if let err = error {
                print("Error getting documents: \(err)")
                completion(.failure(.recieveNilBody))
            } else {
                var arrayList = [ArticleRemote]()
                for document in querySnapshot!.documents {
                    print("DataSore -> \(document.documentID) => \(document.data())")
                    guard let response = document.data() as? [String: String] else { return }
                    arrayList.append(ArticleRemote(dictionary: response ))
                }
                completion(.success(arrayList))
            }
        }
    }
    
    func getArticles(completion: @escaping ([ArticleLocal]) -> Void) {
        getFromRemoteDataStore(){ result in
            switch result {
            case .failure(let failure): print("DataSore \(#function) \(failure.localizedDescription)");  self.get(completion: completion)
            case .success(let response): self.deleteAllObject(); self.add(remote: response, completion: completion);
            }
        }
    }
    
    
    //MARK:-> Local datasotre
    func get(completion: @escaping ([ArticleLocal]) -> Void) {
         let realm = try! Realm()
        let object = realm.objects(ArticleLocal.self).toArray(ofType: ArticleLocal.self) as [ArticleLocal]
        completion(object)
    }
    
    func add(remote articles: [ArticleRemote], completion:@escaping ([ArticleLocal]) -> Void){
        for article in articles {
            add(remote: article)
        }
        get(completion: completion)
    }
    
    private func deleteAllObject(){
        let realm = try! Realm()
        try! realm.write {
          realm.deleteAll()
        }
    }
    
    func add(remote article: ArticleRemote) {
        add(id: article.id, imageUrl: article.imageUrl, itemDescription: article.description, title: article.title, text: article.text)
    }
    
    func add(id: String, imageUrl: String, itemDescription: String, title: String, text: String){
        let realm = try! Realm()
        try! realm.write(){
            let localArticle = ArticleLocal()
            localArticle.id = id
            localArticle.imageUrl = imageUrl
            localArticle.itemDescription = itemDescription
            localArticle.title = title
            localArticle.text = text
            realm.add(localArticle)
        }
    }
    
    
    
}


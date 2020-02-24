//
//  LocalDataStore.swift
//  KvartaKavy
//
//  Created by dewill on 20.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import RealmSwift
//
//class LocalDataStore {
//
//    func get(completion: @escaping ([ArticleLocal]) -> Void) {
//        let realm = try! Realm()
//        let object = realm.objects(ArticleLocal.self).toArray(ofType: ArticleLocal.self) as [ArticleLocal]
//        completion(object)
//    }
//    
//    func add(remote articles: [ArticleRemote], completion:@escaping ([ArticleLocal]) -> Void) {
//        for article in articles {
//            add(remote: article)
//        }
//        get(completion: completion)
//    }
//    
//    internal func deleteAllObject(){
//        let realm = try! Realm()
//        try! realm.write {
//            realm.deleteAll()
//        }
//    }
//    
//    internal  func add(remote article: ArticleRemote) {
//        add(id: article.id, imageUrl: article.imageUrl, itemDescription: article.description, title: article.title, text: article.text)
//    }
//    
//    func add(id: String, imageUrl: String, itemDescription: String, title: String, text: String){
//        let realm = try! Realm()
//        try! realm.write(){
//            let localArticle = ArticleLocal()
//            localArticle.id = id
//            localArticle.imageUrl = imageUrl
//            localArticle.itemDescription = itemDescription
//            localArticle.title = title
//            localArticle.text = text
//            realm.add(localArticle)
//        }
//    }
//    
//    
//    
//}

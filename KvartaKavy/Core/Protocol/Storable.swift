//
//  Storable.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol Storable {
    var storage: Firestore? { get set}
    
    func add(articleDictionary: [String: String])
    func getArticles(compentition: @escaping (Result<[ArticleRemote], ApiError>)-> Void)
}

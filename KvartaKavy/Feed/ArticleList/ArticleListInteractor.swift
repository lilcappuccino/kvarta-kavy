//
//  ArticleListInteractor.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import RealmSwift

protocol ArticleListInteractorOutputs: AnyObject{
}

final class ArticleListInteractor: Interactorable {
    weak var presenter: ArticleListInteractorOutputs?
    
    func getArticles(completion: @escaping (Result<[ArticleRemote], ApiError>) -> Void) {
        RemoteDataStore.shared.getFromRemoteDataStore(){ result in
            completion(result)
        }
    }
    
}

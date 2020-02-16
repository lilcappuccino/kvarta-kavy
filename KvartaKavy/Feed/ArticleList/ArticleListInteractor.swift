//
//  ArticleListInteractor.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol ArticleListInteractorOutputs: AnyObject{
//    func get()
}

final class ArticleListInteractor: Interactorable {
    weak var presenter: ArticleListInteractorOutputs?
    
}

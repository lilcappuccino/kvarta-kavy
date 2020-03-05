//
//  ArticleListInteractor.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol SaleInteractorOutputs: AnyObject{
//    func get()
}

final class SaleInteractor: Interactorable {
    weak var presenter: SaleInteractorOutputs?
    
}

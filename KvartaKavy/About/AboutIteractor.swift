//
//  ArticleListInteractor.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol AboutInteractorOutputs: AnyObject{
//    func get()
}

final class AboutInteractor: Interactorable {
    weak var presenter: AboutInteractorOutputs?
    
}

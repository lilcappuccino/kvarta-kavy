//
//  ArticleListPresenter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias ArticleListDependencies = (
    interactor: ArticleListInteractor,
    router: ArticleListRouterOutput
)

final class ArticleListPresenter: Presenterable {
    private weak var view: ArticleListViewInputs!
    let dependencies: ArticleListDependencies

       init(view: ArticleListViewInputs,
            dependencies: ArticleListDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

extension ArticleListPresenter: ArticleListViewOutputs {
    func viewDidLoad() {
    
    }
}
    
    
    
extension ArticleListPresenter: ArticleListInteractorOutputs{
        
    }
    
    


//
//  ArticleListPresenter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias ArticleDetailsDependencies = (
    interactor: ArticleDetailsInteractor,
    router: ArticleDetailsRouterOutput
)

final class ArticleDetailsPresenter: Presenterable {
    private weak var view: ArticleDetailsViewInputs!
    let dependencies: ArticleDetailsDependencies

       init(view: ArticleDetailsViewInputs,
            dependencies: ArticleDetailsDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

//MARK: View
extension ArticleDetailsPresenter: ArticleDetailsViewOutputs {
    func skipButtonLocalize() -> String {
        return ""
    }
    
    func viewDidLoad() {
    
    }
}
    
    
    
extension ArticleDetailsPresenter: ArticleDetailsInteractorOutputs{
        
    }
    
    


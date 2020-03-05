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
    let entity: ArticleDetailsEntity
    
    init(view: ArticleDetailsViewInputs,
         dependencies: ArticleDetailsDependencies, entity: ArticleDetailsEntity)
    {
        self.view = view
        self.dependencies = dependencies
        self.entity = entity
    }
}

//MARK: View
extension ArticleDetailsPresenter: ArticleDetailsViewOutputs {
    func getTitle() -> String {
        entity.title
    }
    
    func getText() -> String {
        entity.text
    }
    
    func getImageUrl() -> URL {
        URL(string: entity.imageUrl)!
    }
    
    
    
    func viewDidLoad() {
        
    }
}



extension ArticleDetailsPresenter: ArticleDetailsInteractorOutputs {
    
}




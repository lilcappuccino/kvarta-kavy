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
    
    private var articles = [ArticleRemote]()
    
    
    init(view: ArticleListViewInputs,
         dependencies: ArticleListDependencies)
    {
        self.view = view
        self.dependencies = dependencies
    }
}

extension ArticleListPresenter: ArticleListViewOutputs {
    
    func viewDidLoad() {
        dependencies.interactor.getArticles(){ result in
            switch result {
            case .success(let articles):  self.articles = articles; self.view.reloadTableView(articles: articles)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    func showArticleDetailsView(cellIndex: Int) {
        let selectedArticle = articles[cellIndex]
        dependencies.router.articleDetails(imageUrl: selectedArticle.imageUrl, title: selectedArticle.title, text: selectedArticle.text)
    }
    
}



extension ArticleListPresenter: ArticleListInteractorOutputs {
    
    
}




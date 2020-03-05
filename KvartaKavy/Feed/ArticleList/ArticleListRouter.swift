//
//  ArticleListRouter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

class ArticleListRouter {
    static func createModule() -> ArticleListViewController{
        let view = ArticleListViewController.instantiate()
        let interactor = ArticleListInteractor()
           let dependencies = ArticleListDependencies(interactor: interactor, router: ArticleListRouterOutput(view))
        let presenter = ArticleListPresenter(view: view, dependencies: dependencies)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}



final class ArticleListRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }
    
    func articleDetails(imageUrl: String, title: String, text: String){
        ArticleDetailsRouterInput().push(from: view, imageUrl: imageUrl, title: title, text: text)
    }
}


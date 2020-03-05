//
//  ArticleListConfigurator.swift
//  KvartaKavy
//
//  Created by dewill on 29.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation


class ArticleListConfigurator {
    static func createModule() -> ArticleListViewController {
        let view = ArticleListViewController.instantiate()
        let interactor = ArticleListInteractor()
        let dependencies = ArticleListDependencies(interactor: interactor, router: ArticleListRouterOutput(view))
        let presenter = ArticleListPresenter(view: view, dependencies: dependencies)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}

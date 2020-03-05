//
//  Configurator.swift
//
//  Created by Vadim Marchenko on 19.02.2020.
//

import Foundation

class ArticleDetailsCongigurator {
    static func createModule(entity: ArticleDetailsEntity) -> ArticleDetailsViewController {
        let view = ArticleDetailsViewController.instantiate()
        let interactor = ArticleDetailsInteractor()
           let dependencies = ArticleDetailsDependencies(interactor: interactor, router: ArticleDetailsRouterOutput(view))
        let presenter = ArticleDetailsPresenter(view: view, dependencies: dependencies, entity: entity)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}


//
//  ArticleListRouter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation


struct ArticleDetailsRouterInput {

    func push(from: Viewable, imageUrl: String, title: String, text: String) {
        let view = ArticleDetailsCongigurator.createModule(entity: ArticleDetailsEntity(imageUrl: imageUrl, title: title, text: text))
        from.push(view, animated: true)
    }
}

final class ArticleDetailsRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }


}


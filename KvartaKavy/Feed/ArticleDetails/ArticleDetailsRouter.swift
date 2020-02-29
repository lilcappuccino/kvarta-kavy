//
//  ArticleListRouter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation


struct ArticleDetailsRouterInput {

    func push(from: Viewable) {
        let view = ArticleDetailsCongigurator.createModule()
        from.push(view, animated: true)
    }
    
    func pushOverFullScrren(from: Viewable){
        let view = ArticleDetailsCongigurator.createModule()
        view.modalPresentationStyle = .overFullScreen
        from.present(view, animated: false)
    }

//    func present(from: Viewable, entryEntity: ListEntryEntity) {
//        let nav = UINavigationController(rootViewController: view(entryEntity: entryEntity))
//        from.present(nav, animated: true)
//    }
}

final class ArticleDetailsRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }


}

//
//final class StartLoginRouter: Routerable {
//
//    private(set) weak var view: Viewable!
//
//    init(_ view: Viewable) {
//        self.view = view
//    }
//
//    func push(from: Viewable) {
//        let view = StartLoginCongigurator.createModule()
//        from.push(view, animated: true)
//    }
//
//    func pushOverFullScrren(from: Viewable){
//        let vc = StartLoginCongigurator.createModule()
//        vc.modalPresentationStyle = .overFullScreen
//        from.present(vc, animated: false)
//    }
////
////    func transitionDetail(gitHubRepository: GitHubRepository) {
////        DetailRouterInput().push(from: view, entryEntity: DetailEntryEntity(gitHubRepository: gitHubRepository))
////    }
//}


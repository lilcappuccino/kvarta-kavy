//
//  ArticleListRouter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation


struct SaleRouterInput {

    func push(from: Viewable) {
        let view = SaleCongigurator.createModule()
        from.push(view, animated: true)
    }
    
    func pushOverFullScrren(from: Viewable){
        let view = SaleCongigurator.createModule()
        view.modalPresentationStyle = .overFullScreen
        from.present(view, animated: false)
    }

//    func present(from: Viewable, entryEntity: ListEntryEntity) {
//        let nav = UINavigationController(rootViewController: view(entryEntity: entryEntity))
//        from.present(nav, animated: true)
//    }
}

final class SaleRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }


}

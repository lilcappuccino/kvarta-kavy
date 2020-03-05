//
//  ArticleListPresenter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias AboutDependencies = (
    interactor: AboutInteractor,
    router: AboutRouterOutput
)

final class AboutPresenter: Presenterable {
    private weak var view: AboutViewInputs!
    let dependencies: AboutDependencies

       init(view: AboutViewInputs,
            dependencies: AboutDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

//MARK: View
extension AboutPresenter: AboutViewOutputs {
    func skipButtonLocalize() -> String {
        return ""
    }
    
    func viewDidLoad() {
    
    }
}
    
    
    
extension AboutPresenter: AboutInteractorOutputs {
        
    }
    
    


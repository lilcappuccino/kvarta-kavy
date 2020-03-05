//
//  ArticleListPresenter.swift
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias SaleDependencies = (
    interactor: SaleInteractor,
    router: SaleRouterOutput
)

final class SalePresenter: Presenterable {
    private weak var view: SaleViewInputs!
    let dependencies: SaleDependencies

       init(view:  SaleViewInputs,
            dependencies: SaleDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

//MARK: View
extension SalePresenter: SaleViewOutputs {
    func skipButtonLocalize() -> String {
        return ""
    }
    
    func viewDidLoad() {
    
    }
}
    
extension SalePresenter: SaleInteractorOutputs{
        
    }
    
    


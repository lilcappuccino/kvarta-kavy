//
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias SignInDependencies = (
    interactor: SignInInteractor,
    router: SignInRouterOutput
)

final class SignInPresenter: Presenterable {
    private weak var view: SignInViewInputs!
    let dependencies: SignInDependencies

       init(view: SignInViewInputs,
            dependencies: SignInDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

//MARK: View
extension SignInPresenter: SignInViewOutputs {
    func skipButtonLocalize() -> String {
        return ""
    }
    
    func viewDidLoad() {
    
    }
}
    
    
    
extension SignInPresenter: SignInInteractorOutputs{
        
    }
    
    


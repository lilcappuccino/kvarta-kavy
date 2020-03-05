//
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

typealias SignUpDependencies = (
    interactor: SignUpInteractor,
    router: SignUpRouterOutput
)

final class SignUpPresenter: Presenterable {
    private weak var view: SignUpViewInputs!
    let dependencies: SignUpDependencies

       init(view: SignUpViewInputs,
            dependencies: SignUpDependencies)
       {
           self.view = view
           self.dependencies = dependencies
       }
}

//MARK: View
extension SignUpPresenter: SignUpViewOutputs {
    func skipButtonLocalize() -> String {
        return ""
    }
    
    func viewDidLoad() {
    
    }
}
    
    
    
extension SignUpPresenter: SignUpInteractorOutputs{
        
    }
    
    


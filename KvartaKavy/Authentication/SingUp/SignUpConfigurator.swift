//
//
//  Created by Vadim Marchenko on 19.02.2020.
//

import Foundation

class SignUpCongigurator {
    static func createModule() -> SignUpViewController {
        let view = SignUpViewController.instantiate()
        let interactor = SignUpInteractor()
           let dependencies = SignUpDependencies(interactor: interactor, router: SignUpRouterOutput(view))
        let presenter = SignUpPresenter(view: view, dependencies: dependencies)
        view.presenter = presenter
        interactor.presenter = presenter
        return view
    }
}


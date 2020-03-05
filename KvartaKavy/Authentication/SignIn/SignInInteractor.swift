//
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol SignInInteractorOutputs: AnyObject{
//    func get()
}

final class SignInInteractor: Interactorable {
    weak var presenter: SignInInteractorOutputs?
    
}

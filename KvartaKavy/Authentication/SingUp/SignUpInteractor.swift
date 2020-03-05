//
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol SignUpInteractorOutputs: AnyObject{
//    func get()
}

final class SignUpInteractor: Interactorable {
    weak var presenter: SignUpInteractorOutputs?
    
}

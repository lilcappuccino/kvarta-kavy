//
//  KvartaKavy
//
//  Created by dewill on 16.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

protocol ArticleDetailsInteractorOutputs: AnyObject{
//    func get()
}

final class ArticleDetailsInteractor: Interactorable {
    weak var presenter: ArticleDetailsInteractorOutputs?
    
    
    
}

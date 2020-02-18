//
//  ArticleRealm.swift
//  KvartaKavy
//
//  Created by Vadim Marchenko on 17.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import RealmSwift

class ArticleLocal: Object {
    @objc var imageUrl = ""
    @objc var itemDescription = ""
    @objc var title = ""
    @objc var  text = ""
    
    init(imageUrl: String, itemDescription: String, title: String, text: String) {
        self.imageUrl = imageUrl
        self.itemDescription = itemDescription
        self.title = title
        self.text = text
    }
    
    required init() {}
    
}

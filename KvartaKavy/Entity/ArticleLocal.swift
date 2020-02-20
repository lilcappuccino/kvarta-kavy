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
    @objc var id = ""
    @objc var imageUrl = ""
    @objc var itemDescription = ""
    @objc var title = ""
    @objc var  text = ""
    
    init(id: String, imageUrl: String, itemDescription: String, title: String, text: String) {
        self.id = id
        self.imageUrl = imageUrl
        self.itemDescription = itemDescription
        self.title = title
        self.text = text
    }
    
    required init() {}
    
}

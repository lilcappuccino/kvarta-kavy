//
//  Article.swift
//  KvartaKavy
//
//  Created by dewill on 15.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation

struct ArticleRemote: Codable {
    let id: String
    let imageUrl, description, title, text: String
    
    
    func generateDictionary() -> [String: String] {
        let dictionary: [String: String] = [
                                            ArticleKey.id.rawValue: self.id,
                                            ArticleKey.imageUrl.rawValue: self.imageUrl,
                                            ArticleKey.description.rawValue: self.description,
                                            ArticleKey.title.rawValue: self.title,
                                            ArticleKey.text.rawValue: self.text]
        return dictionary
    }
    
    init(dictionary: [String: String]) {
        self.id = dictionary[ArticleKey.id.rawValue] ?? "wrong id"
        self.imageUrl = dictionary[ArticleKey.imageUrl.rawValue] ?? ""
        self.description = dictionary[ArticleKey.description.rawValue] ?? ""
        self.title = dictionary[ArticleKey.title.rawValue] ?? ""
        self.text = dictionary[ArticleKey.text.rawValue] ?? ""
    }
}

fileprivate enum ArticleKey: String {
    typealias RawValue = String
    case id = "id"
    case imageUrl = "imageUrl"
    case description = "description"
    case title = "title"
    case text = "text"
}


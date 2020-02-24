//
//  ArticleListDataSource.swift
//  KvartaKavy
//
//  Created by dewill on 21.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import UIKit

class ArticleListDataSource: NSObject {
    
    var articles = [ArticleRemote]()
    
}

extension ArticleListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = articles[indexPath.item]
        let cell: ArticleListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleListTableViewCell", for: indexPath) as! ArticleListTableViewCell
        cell.config(imageUrl: item.imageUrl, title: item.title, description: item.description)
        return cell
    }
    
    
    
}

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
    
    // we set a variable to hold the contentOffSet before scroll view scrolls
    var lastContentOffset: CGFloat = 0
    var lastShowedItemIndex = -1
    var isScrollDown = true
    
}

//MARK:-> UITableViewDataSource
extension ArticleListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = articles[indexPath.item]
        let cell = tableView.dequeueReusableCell(with: ArticleListTableViewCell.self, for: indexPath)
        cell.config(imageUrl: item.imageUrl, title: item.title, description: item.description)
        return cell
    }
    
}

//MARK:-> UITableViewDelegate
extension ArticleListDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if  indexPath.row > 1 || !isScrollDown{ return }
        
        lastShowedItemIndex = indexPath.row
        print("VADIM \(lastShowedItemIndex) -- row - \(indexPath.item)")
        let animation = Animator.makeMoveUpWithBounce(rowHeight: cell.frame.height, duration: 1.0, delayFactor: 0.05)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }
    


    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.lastContentOffset < scrollView.contentOffset.y {
            isScrollDown = true
        } else if self.lastContentOffset > scrollView.contentOffset.y {
           isScrollDown = false
        } else {
            // didn't move
        }
    }
}

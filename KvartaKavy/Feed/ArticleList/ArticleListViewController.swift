//
//  FeedTableViewController.swift
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

protocol ArticleListViewInputs: AnyObject {
    //func reloadTableView(tableViewDataSource: Int)
}

protocol ArticleListViewOutputs: AnyObject {
    func viewDidLoad()
}


final class ArticleListViewController: UIViewController {
    
    internal var presenter: ArticleListViewOutputs?
//    internal var tableViewDataSource: TableViewItemDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "KVARTA KAVY"
             navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.textTitle]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textTitle]
        tableView.backgroundColor = .clear
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textTitle]
        navigationController?.navigationBar.barTintColor = .background
        
       
        tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home-icon-not-active"), selectedImage: #imageLiteral(resourceName: "home-icon-active"))
        
        // Do any additional setup after loading the view.
        DataSore.shared.getArticles() { result in
            switch result {
            case .failure(let failure): print(failure.localizedDescription)
            case .success(let articleList): print(articleList.first?.title)
            }
        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ArticleListViewController: ArticleListViewInputs{
    
}

extension ArticleListViewController: Viewable {
    static var storyboardName: StoryboardName = .article
}

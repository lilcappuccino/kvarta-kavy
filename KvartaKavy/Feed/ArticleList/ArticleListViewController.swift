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
    
    var articles = [ArticleLocal]()
    
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
        tableView.register(ArticleListTableViewCell.self, forCellReuseIdentifier: "ArticleListTableViewCell")
        tableView.dataSource = self
       
        DataStoreService.shared.getArticles(){ articles in
            self.articles = articles
            self.tableView.reloadData()
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

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleListTableViewCell", for: indexPath) as! ArticleListTableViewCell
        let currentArticle = articles[indexPath.item]
        cell.config(imageUrl: currentArticle.imageUrl, title: currentArticle.title, description: currentArticle.description)
        return cell
    }
    
    
}

extension ArticleListViewController: ArticleListViewInputs{
    
}

extension ArticleListViewController: Viewable {
    static var storyboardName: StoryboardName = .article
}

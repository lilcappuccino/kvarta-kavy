//
//  FeedTableViewController.swift
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

protocol ArticleListViewInputs: AnyObject {
    func reloadTableView(articles: [ArticleRemote])
}

protocol ArticleListViewOutputs: AnyObject {
    func viewDidLoad()
}


final class ArticleListViewController: UIViewController {
    
    internal var presenter: ArticleListViewOutputs?
    private var dataSource: ArticleListDataSource!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        view.backgroundColor = .black
        configTable()
        configNavigationBar()
        
    }
    
    private func configTable(){
        tableView.backgroundColor = .clear
        dataSource = ArticleListDataSource()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.register(cellType: ArticleListTableViewCell.self, bundle: nil)
    }
    
    private func configNavigationBar(){
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "KVARTA KAVY"
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.textTitle]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textTitle]
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textTitle]
        navigationController?.navigationBar.barTintColor = .background
        tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "home-icon-not-active"), selectedImage: #imageLiteral(resourceName: "home-icon-active"))
    }
    
}

extension ArticleListViewController: ArticleListViewInputs {
    func reloadTableView(articles: [ArticleRemote]) {
        dataSource?.articles = articles
        dataSource?.articles.append(contentsOf: articles)
        dataSource?.articles.append(contentsOf: articles)
        dataSource?.articles.append(contentsOf: articles)
        dataSource?.articles.append(contentsOf: articles)
        dataSource?.articles.append(contentsOf: articles)
        tableView.reloadData()
    }
    
}

extension ArticleListViewController: Viewable {
    static var storyboardName: StoryboardName = .article
}






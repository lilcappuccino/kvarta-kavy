//
//  FeedTableViewController.swift
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

protocol ArticleDetailsViewInputs: AnyObject {
    //func reloadTableView(tableViewDataSource: Int)
}

protocol ArticleDetailsViewOutputs: AnyObject {
    func viewDidLoad()
    func getImageUrl() -> URL
    func getTitle() -> String
    func getText() -> String
}


final class ArticleDetailsViewController: UIViewController {
    
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleText: UILabel!
    @IBOutlet weak var scrollViw: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    private var isCollaping = false
    var constaint: NSLayoutConstraint?
    private var isCollapsing = false
    
    internal var presenter: ArticleDetailsViewOutputs?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // initAnimator()
        contentView.layer.cornerRadius = 18
        scrollViw.isUserInteractionEnabled = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = true
        guard let presenter = presenter else { return }
        articleImage.sd_setImage(with: presenter.getImageUrl(), completed: nil)
        articleTitle.text = presenter.getTitle()
        articleText.text = presenter.getText()
        scrollViw.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
                navigationController?.navigationBar.prefersLargeTitles = false
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func collapsingAnimation() {
        if isCollaping { return }
        isCollaping = true
        constaint = scrollViw.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        constaint?.isActive = true
        let headerAnimator = UIViewPropertyAnimator(duration: 0.2, curve: .linear, animations: {
            self.view.layoutIfNeeded()
//            self.articleImage.alpha =
            self.articleImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
        })
        headerAnimator.startAnimation()
    }
    
    func expandingAnimation() {
        if !isCollaping { return }
        isCollaping = false
        constaint?.isActive = false
        let headerAnimator = UIViewPropertyAnimator(duration: 0.2, curve: .linear, animations: {
            self.view.layoutIfNeeded()
            self.articleImage.alpha = 1
            self.articleImage.transform = .identity
        })
        headerAnimator.startAnimation()
    }
   
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up: collapsingAnimation()
        case .down: expandingAnimation()
        default:
            break
        }
    }
    
}

extension ArticleDetailsViewController: ArticleDetailsViewInputs {
    
}

extension ArticleDetailsViewController: Viewable {
    static var storyboardName: UIStoryboard.Name = .article
}

extension ArticleDetailsViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
        print("\(scrollView.contentOffset.y)")
    //        let y = scrollView.contentOffset.y
    //        print(y)
    //        if y > 0 {
    //            if headerAnimator == nil {
    //                initAnimator()
    //            }
    //            headerAnimator.fractionComplete = abs(y) * 0.001
    //        }//
        
    }
}

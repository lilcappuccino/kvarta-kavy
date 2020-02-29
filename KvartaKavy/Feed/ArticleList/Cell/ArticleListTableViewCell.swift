//
//  ArticleListTableViewCell.swift
//  
//
//  Created by Vadim Marchenko on 25.02.2020.
//

import UIKit
import SDWebImage

class ArticleListTableViewCell: UITableViewCell {
    
    //MARK:-> Property
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    private var gradient: CAGradientLayer!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = self.bounds
    }
    
    private func setupCellUI() {
        view.backgroundColor = .clear
        articleImageView.layer.cornerRadius = 20
        gradient = createGradient(colors: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25), UIColor.black.cgColor])
        articleImageView.alpha = 0.8
        articleImageView.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func config(imageUrl: String, title: String, description: String) {
         titleLabel.text = title
        if let url = URL(string: imageUrl){
            articleImageView.sd_setImage(with: url, completed: nil)
        }
    }
    
   
}

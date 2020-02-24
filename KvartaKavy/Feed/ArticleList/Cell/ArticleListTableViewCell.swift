//
//  ArticleListTableViewCell.swift
//  KvartaKavy
//
//  Created by dewill on 24.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleListTableViewCell: UITableViewCell {
    static let identifier = "ArticleListTableViewCell"
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(imageUrl: String, title: String, description: String){
        if let url = URL(string: imageUrl){
            articleImageView.sd_setImage(with: url, completed: nil)
        }
        titleLabel.text = title
    }
    
}

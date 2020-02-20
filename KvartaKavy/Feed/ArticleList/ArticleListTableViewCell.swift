//
//  ArticleListTableViewCell.swift
//  KvartaKavy
//
//  Created by dewill on 20.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleListTableViewCell: UITableViewCell {
    @IBOutlet weak var itemView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(imageUrl: String, title: String, description: String) {
        itemImageView.sd_setImage(with: URL(string: imageUrl)!, completed: nil)
        titleLabel.text = title
        descriptionLabel.text = description
    }

}

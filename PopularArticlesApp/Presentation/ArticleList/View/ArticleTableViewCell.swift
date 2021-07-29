//
//  ArticleTableViewCell.swift
//  PopularArticlesApp
//
//  Created by Bhavi Mistry on 29/07/2021.
//

import UIKit
import Kingfisher

final class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    func configure(_ item: Article?, at indexPath: IndexPath) {
        titleLabel.text = item?.title
        descriptionLabel.text = item?.abstract
        authorNameLabel.text = item?.byline
        publishedDateLabel.text = item?.publishedDate
        articleImageView.layer.cornerRadius = articleImageView.frame.size.width / 2
        
        guard let thumbImageURL = item?.thumbImage,
              let url = URL(string: thumbImageURL) else {
            return
        }
        
        articleImageView.kf.setImage(with: url)
    }
}

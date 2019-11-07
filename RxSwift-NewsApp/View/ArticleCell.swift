//
//  ArticleCell.swift
//  RxSwift-NewsApp
//
//  Created by kawaharadai on 2019/11/07.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subTitleLabel: UILabel!

    static var identifier: String {
        return String(describing: self)
    }

    func setInfo(article: Article) {
        titleLabel.text = article.title
        subTitleLabel.text = article.description
    }
}

//
//  ArticleTitleCell.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class ArticleTitleCell: UITableViewCell {

  static let identifier = String(describing: ArticleTitleCell.self)

  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var sectionLabel: UILabel!
  @IBOutlet private var authorLabel: UILabel!
  @IBOutlet private var dateLabel: UILabel!

  func apply(_ article: ArticleInfo) {
    titleLabel.text = article.title
    sectionLabel.text = article.section
    authorLabel.text = article.author
    dateLabel.text = article.creationDate
  }

}

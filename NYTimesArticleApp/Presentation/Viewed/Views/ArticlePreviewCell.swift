//
//  ArticlePreviewCell.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class ArticlePreviewCell: UITableViewCell {

  static let identifier = String(describing: ArticlePreviewCell.self)

  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var dateLabel: UILabel!
  @IBOutlet private var sectionLabel: UILabel!
  @IBOutlet private var abstractLabel: UILabel!

  func apply(_ article: ArticleInfo) {
    titleLabel.text = article.title
    dateLabel.text = article.creationDate
    sectionLabel.text = article.section
    abstractLabel.text = article.abstract
  }
}

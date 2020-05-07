//
//  ArticleInfoCell.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol TappingFromCellInterface: class {
  func didSelect()
}

class ArticleInfoCell: UITableViewCell {

  static let identifier = String(describing: ArticleInfoCell.self)

  @IBOutlet private var abstractLabel: UILabel!

  weak var delegate: TappingFromCellInterface?

  func apply(_ article: ArticleInfo) {
    abstractLabel.text = article.abstract
  }

  @IBAction private func showFullArticle(_ sender: UIButton) {
    delegate?.didSelect()
  }

}

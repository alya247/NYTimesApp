//
//  ArticleMediaCell.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

class ArticleMediaCell: UITableViewCell {

  static let identifier = String(describing: ArticleMediaCell.self)

  @IBOutlet private var captionLabel: UILabel!
  @IBOutlet private var mediaImageView: UIImageView!
  @IBOutlet private var imageHeightConstraint: NSLayoutConstraint!

  private let imageOffset: CGFloat = 33

  func apply(_ article: ArticleInfo) {
    captionLabel.text = article.caption
    guard let url = article.mediaURL else { return }
    mediaImageView.load(url)

    let width = UIScreen.main.bounds.width - imageOffset * 2
    let height = width / CGFloat(article.mediaRatio)
    imageHeightConstraint.constant = height
  }

}

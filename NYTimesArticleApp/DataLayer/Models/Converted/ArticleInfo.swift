//
//  ArticleInfo.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

struct ArticleInfo {

  var id: Double = 0
  var title: String = ""
  var abstract: String = ""
  var section: String = ""
  var creationDate: String = ""
  var author: String = ""
  var caption: String = ""
  var url: String = ""
  var mediaURL: URL?
  var mediaRatio: Double = 1

  init(model: Article) {
    self.id = model.id ?? 0
    self.title = model.title ?? ""
    self.abstract = model.abstract ?? ""
    self.section = model.section ?? ""
    self.creationDate = model.creationDate ?? ""
    self.author = model.author ?? ""
    self.url = model.url ?? ""

    if let media = model.media?.last, let data = media.data?.last, let urlString = data.url {
      self.caption = media.caption ?? ""
      self.mediaURL = URL(string: urlString)
      self.mediaRatio = Double((data.width ?? 1) / (data.height ?? 1))
    }
  }

  init(object: ArticleModel) {
    self.id = Double(object.id)
    self.title = object.title ?? ""
    self.abstract = object.abstract ?? ""
    self.section = object.section ?? ""
    self.creationDate = object.creationDate ?? ""
    self.author = object.author ?? ""
    self.url = object.url ?? ""
    self.caption = object.caption ?? ""
    self.mediaRatio = object.mediaRatio
    if let urlString = object.mediaURL {
      self.mediaURL = URL(string: urlString)
    }
  }

}

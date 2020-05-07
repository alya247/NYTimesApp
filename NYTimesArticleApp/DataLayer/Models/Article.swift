//
//  Article.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

struct Article: Codable {

  var id: Double?
  var title: String?
  var abstract: String?
  var section: String?
  var creationDate: String?
  var author: String?
  var url: String?
  var media: [ArticleMedia]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decode(Double.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    abstract = try container.decode(String.self, forKey: .abstract)
    section = try container.decode(String.self, forKey: .section)
    creationDate = try container.decode(String.self, forKey: .creationDate)
    author = try container.decode(String.self, forKey: .author)
    url = try container.decode(String.self, forKey: .url)
    media = try container.decode([ArticleMedia].self, forKey: .media)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(title, forKey: .title)
    try container.encode(abstract, forKey: .abstract)
    try container.encode(section, forKey: .section)
    try container.encode(creationDate, forKey: .creationDate)
    try container.encode(author, forKey: .author)
    try container.encode(url, forKey: .url)
    try container.encode(media, forKey: .media)
  }

  enum CodingKeys: String, CodingKey {
    case id
    case title
    case abstract
    case section
    case creationDate = "published_date"
    case author = "byline"
    case url
    case media
  }

}

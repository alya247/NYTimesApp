//
//  ArticleMedia.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

struct ArticleMedia: Codable {

  var caption: String?
  var data: [ArticleMediaData]?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    caption = try container.decode(String.self, forKey: .caption)
    data = try container.decode([ArticleMediaData].self, forKey: .data)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(caption, forKey: .caption)
    try container.encode(data, forKey: .data)
  }

  enum CodingKeys: String, CodingKey {
    case caption
    case data = "media-metadata"
  }

}

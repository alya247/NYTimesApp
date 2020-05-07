//
//  ArticleMediaData.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

struct ArticleMediaData: Codable {

  var url: String?
  var height: Int?
  var width: Int?

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    url = try container.decode(String.self, forKey: .url)
    height = try container.decode(Int.self, forKey: .height)
    width = try container.decode(Int.self, forKey: .width)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(url, forKey: .url)
    try container.encode(height, forKey: .height)
    try container.encode(width, forKey: .width)
  }

  enum CodingKeys: String, CodingKey {
    case url
    case height
    case width
  }

}

//
//  SharedRequest.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

class SharedRequest: Request {

  typealias ResponseModel = Article

  var path: String {
    return "/shared/\(days)\(suffix)"
  }

  var parameters: [String: String] {
    return ["api-key": apiKey]
  }

  private var days: Int

  init(days: Int = 30) {
    self.days = days
  }

}

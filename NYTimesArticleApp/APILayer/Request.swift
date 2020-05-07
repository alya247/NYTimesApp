//
//  Request.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

protocol Request {

  associatedtype ResponseModel: Decodable

  var path: String { get }
  var apiKey: String { get }
  var version: String { get }
  var suffix: String { get }
  var parameters: [String: String] { get }
  func serializationRule(for data: Any?) -> [[String: Any]]?
}

extension Request {

  var apiKey: String {
    return RequestAPI.apiKey
  }

  var version: String {
    return "v2"
  }

  var suffix: String {
    return ".json"
  }

  func serializationRule(for data: Any?) -> [[String: Any]]? {
    guard let result = data as? [String: Any], let resultArray = result["results"] as? [[String: Any]] else { return nil }
    return resultArray
  }

}

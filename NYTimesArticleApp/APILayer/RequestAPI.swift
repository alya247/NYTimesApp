//
//  RequestAPI.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import Alamofire

class RequestAPI {

  static let apiKey = "77AtnxepKCEgMI7ZpjRzDAlgOnOSbKGF"
  static private let apiURL = "https://api.nytimes.com/svc/mostpopular/"

  static func requestData<T: Request>(_ request: T, completion: @escaping ((T.ResponseModel?) -> Void)) {
    let url = RequestAPI.apiURL + request.version + request.path

    AF.request(url,
               parameters: request.parameters,
               encoder: URLEncodedFormParameterEncoder.default).responseJSON { r in

                guard let serializedData = request.serializationRule(for: r.value) else {
                  completion(nil)
                  return
                }

                if let article = try? JSONDecoder().decode(T.ResponseModel.self, from: JSONSerialization.data(withJSONObject: serializedData)) {
                  completion(article)
                }
    }
  }

  static func requestArrayData<T: Request>(_ request: T, completion: @escaping (([T.ResponseModel]?) -> Void)) {
    let url = RequestAPI.apiURL + request.version + request.path

    AF.request(url,
               parameters: request.parameters,
               encoder: URLEncodedFormParameterEncoder.default).responseJSON { r in

                guard let serializedData = request.serializationRule(for: r.value) else {
                  completion(nil)
                  return
                }

                if let articles = try? JSONDecoder().decode(Array<T.ResponseModel>.self, from: JSONSerialization.data(withJSONObject: serializedData)) {
                  completion(articles)
                }
    }
  }

}

//
//  ArticleWebDetailRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol ArticleWebDetailRouterInterface: class {
  var htmlURL: String { get set }
}

class ArticleWebDetailRouter: ArticleWebDetailRouterInterface {

  private weak var currentController: UIViewController!
  var htmlURL: String

  init(htmlURL: String) {
    self.htmlURL = htmlURL
  }

  func execute(_ context: UINavigationController) {
    let view = UIStoryboard(name: Resource.Storyboard.detail.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.detailWeb.name) as! ArticleWebDetailController
    view.router = self
    currentController = view

    context.pushViewController(view, animated: true)
  }

}

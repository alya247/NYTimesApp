//
//  ArticleDetailRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol ArticleDetailRouterInterface: class {

  func viewFullArticle()
}

class ArticleDetailRouter {

  private weak var currentController: UIViewController!
  private let article: ArticleInfo
  private let coreDataStack: CoreDataStack

  init(coreDataStack: CoreDataStack, article: ArticleInfo) {
    self.coreDataStack = coreDataStack
    self.article = article
  }

  func execute(_ context: UINavigationController) {
    let view = UIStoryboard(name: Resource.Storyboard.detail.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.detail.name) as! ArticleDetailController
    let interactor = ArticleDetailInteractor(coreDataStack: coreDataStack, article: article)
    let presenter = ArticleDetailPresenter(interactor: interactor, router: self)
    view.presenter = presenter
    currentController = view

    context.pushViewController(view, animated: true)
  }

}

//MARK: - ArticleDetailRouterInterface

extension ArticleDetailRouter: ArticleDetailRouterInterface {

  func viewFullArticle() {
    guard article.url != "" else { return }
    ArticleWebDetailRouter(htmlURL: article.url).execute(currentController.navigationController!)
  }
  
}

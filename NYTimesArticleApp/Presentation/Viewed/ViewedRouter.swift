//
//  ViewedRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol ViewedRouterInterface: CommonRouterInterface { }

class ViewedRouter {

  private var currentController: UIViewController!
  private let coreDataStack: CoreDataStack

  var tabIcon: UIImage = Resource.Asset.viewedIcon.image
  var tabTitle: String = "MOST VIEWED"

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
  }

}

//MARK: - ViewedRouterInterface

extension ViewedRouter: ViewedRouterInterface {

  func openArticleDetail(_ article: ArticleInfo) {
    ArticleDetailRouter(coreDataStack: coreDataStack, article: article).execute(currentController.navigationController!)
  }

  func openSavedArticles() {
    SavedArticleRouter(coreDataStack: coreDataStack).execute(currentController.navigationController!)
  }

}

//MARK: - TabBarInterface

extension ViewedRouter: TabBarInterface {

  func configuredViewController() -> UIViewController {
    let view = UIStoryboard(name: Resource.Storyboard.viewed.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.viewed.name) as! ViewedController

    let interactor: InteractorInterface = ViewedInteractor()
    let presenter: ViewedPresenter = ViewedPresenter(interactor: interactor, router: self)
    view.presenter = presenter
    currentController = view

    return view
  }
}

//
//  SharedRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol SharedRouterInterface: CommonRouterInterface { }

class SharedRouter {

  private let coreDataStack: CoreDataStack
  private var currentController: UIViewController!

  var tabIcon: UIImage = Resource.Asset.sharedIcon.image
  var tabTitle: String = "MOST SHARED"

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
  }

}

//MARK: - SharedRouterInterface

extension SharedRouter: SharedRouterInterface {

  func openArticleDetail(_ article: ArticleInfo) {
    ArticleDetailRouter(coreDataStack: coreDataStack, article: article).execute(currentController.navigationController!)
  }

  func openSavedArticles() {
    SavedArticleRouter(coreDataStack: coreDataStack).execute(currentController.navigationController!)
  }
  
}

//MARK: - TabBarInterface

extension SharedRouter: TabBarInterface {

  func configuredViewController() -> UIViewController {
    let view = UIStoryboard(name: Resource.Storyboard.shared.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.shared.name) as! SharedController

    let interactor: InteractorInterface = SharedInteractor()
    let presenter: SharedPresenter = SharedPresenter(interactor: interactor, router: self)
    view.presenter = presenter
    currentController = view

    return view
  }
}

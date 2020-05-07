//
//  EmailedRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol EmailedRouterInterface: CommonRouterInterface { }

class EmailedRouter {

  private let coreDataStack: CoreDataStack
  private var currentController: UIViewController!

  var tabIcon: UIImage = Resource.Asset.emailedIcon.image
  var tabTitle: String = "MOST EMAILED"

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
  }

}

//MARK: - EmailedRouterInterface

extension EmailedRouter: EmailedRouterInterface {

  func openArticleDetail(_ article: ArticleInfo) {
    ArticleDetailRouter(coreDataStack: coreDataStack, article: article).execute(currentController.navigationController!)
  }

  func openSavedArticles() {
    SavedArticleRouter(coreDataStack: coreDataStack).execute(currentController.navigationController!)
  }
  
}

//MARK: - TabBarInterface

extension EmailedRouter: TabBarInterface {

  func configuredViewController() -> UIViewController {
    let view = UIStoryboard(name: Resource.Storyboard.emailed.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.emailed.name) as! EmailedController

    let interactor: InteractorInterface = EmailedInteractor()
    let presenter: EmailedPresenter = EmailedPresenter(interactor: interactor, router: self)
    view.presenter = presenter
    currentController = view

    return view
  }
}

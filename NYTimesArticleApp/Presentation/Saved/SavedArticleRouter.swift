//
//  SavedArticleRouter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import UIKit

protocol SavedArticleRouterInterface: CommonRouterInterface { }

class SavedArticleRouter {

  private let coreDataStack: CoreDataStack
  private var currentController: UIViewController!

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
  }

  func execute(_ context: UINavigationController) {
    let view = UIStoryboard(name: Resource.Storyboard.saved.name, bundle: nil).instantiateViewController(withIdentifier: Resource.Controller.saved.name) as! SavedArticleController
    let interactor = SavedArticleInteractor(coreDataStack: coreDataStack)
    let presenter = SavedArticlePresenter(interactor: interactor, router: self)
    view.presenter = presenter
    currentController = view

    context.pushViewController(view, animated: true)
  }

}

//MARK: - SavedArticleRouterInterface

extension SavedArticleRouter: SavedArticleRouterInterface {

  func openArticleDetail(_ article: ArticleInfo) {
    ArticleDetailRouter(coreDataStack: coreDataStack, article: article).execute(currentController.navigationController!)
  }
  
}

//
//  SavedArticlePresenter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

protocol SavedArticlePresenterInterface: class {

  var articles: [ArticleInfo] { get }
  func openArticleDetail(_ article: ArticleInfo)
}

class SavedArticlePresenter {

  var interactor: SavedArticleInteractorInterface!
  var router: SavedArticleRouterInterface!

  var articles: [ArticleInfo] {
    return interactor.getArticles()
  }

  init(interactor: SavedArticleInteractorInterface, router: SavedArticleRouterInterface) {
    self.interactor = interactor
    self.router = router
  }

}

//MARK: - SavedArticlePresenterInterface

extension SavedArticlePresenter: SavedArticlePresenterInterface {

  func openArticleDetail(_ article: ArticleInfo) {
    router.openArticleDetail(article)
  }

}

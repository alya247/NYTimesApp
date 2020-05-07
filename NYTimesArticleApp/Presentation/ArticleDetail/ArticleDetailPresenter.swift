//
//  ArticleDetailPresenter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ArticleDetailPresenterInterface: class {

  var article: ArticleInfo { get }
  var isArticleSaved: Observable<Bool> { get }
  func viewFullArticle()
  func saveArticleIfNeeded()
}

class ArticleDetailPresenter {

  private let interactor: ArticleDetailInteractorInterface
  private let router: ArticleDetailRouterInterface

  init(interactor: ArticleDetailInteractorInterface, router: ArticleDetailRouterInterface) {
    self.interactor = interactor
    self.router = router
  }

  var article: ArticleInfo {
    return interactor.article
  }

  var isArticleSaved: Observable<Bool> {
    return interactor.isArticleSaved
  }

}

//MARK: - ArticleDetailPresenterInterface

extension ArticleDetailPresenter: ArticleDetailPresenterInterface {

  func viewFullArticle() {
    router.viewFullArticle()
  }

  func saveArticleIfNeeded() {
    interactor.saveArticleIfNeeded()
  }
  
}

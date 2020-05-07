//
//  CommonPresenter.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//MARK: - CommonRouterInterface

protocol CommonRouterInterface: class {
  func openArticleDetail(_ article: ArticleInfo)
  func openSavedArticles()
}

extension CommonRouterInterface {
  func openSavedArticles() { }
}

//MARK: - InteractorInterface

protocol InteractorInterface: class {
  var articles: Observable<[ArticleInfo]> { get }
  func loadViewdArticles()
}

//MARK: - CommonPresenterInterface

protocol CommonPresenterInterface: class {
  var interactor: InteractorInterface! { get set }
  var router: CommonRouterInterface! { get set }
  var articles: Observable<[ArticleInfo]> { get }
  func loadViewdArticles()
  func openSavedArticles()
}

extension CommonPresenterInterface {

  var articles: Observable<[ArticleInfo]> {
    return interactor.articles
  }

  func loadViewdArticles() {
    interactor.loadViewdArticles()
  }

  func openArticleDetail(_ article: ArticleInfo) {
    router.openArticleDetail(article)
  }

  func openSavedArticles() {
    router.openSavedArticles()
  }
}

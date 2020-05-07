//
//  ArticleDetailInteractor.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ArticleDetailInteractorInterface {

  var article: ArticleInfo { get set }
  var isArticleSaved: Observable<Bool> { get }
  func saveArticleIfNeeded()
}

class ArticleDetailInteractor {

  var article: ArticleInfo
  private let coreDataStack: CoreDataStack
  private let dataManager: DataManager
  private var isArticleSavedSubject: BehaviorSubject<Bool>

  var isArticleSaved: Observable<Bool> {
    return isArticleSavedSubject.asObservable()
  }

  init(coreDataStack: CoreDataStack, article: ArticleInfo) {
    self.article = article
    self.coreDataStack = coreDataStack
    self.dataManager = DataManager(context: coreDataStack.context)
    isArticleSavedSubject = BehaviorSubject<Bool>(value: dataManager.isArticleSaved(article.id))
  }

}

//MARK: - ArticleDetailInteractorInterface

extension ArticleDetailInteractor: ArticleDetailInteractorInterface {

  func saveArticleIfNeeded() {
    let id = article.id
    if dataManager.isArticleSaved(id) {
      dataManager.deleteArticle(id)
    } else {
      dataManager.saveArticle(article)
    }
    isArticleSavedSubject.onNext(dataManager.isArticleSaved(id))
  }
  
}

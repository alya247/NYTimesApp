//
//  EmailedInteractor.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol EmailedInteractorInterface: InteractorInterface { }

class EmailedInteractor {

  var articles: Observable<[ArticleInfo]> {
    return articlesSubject.asObservable()
  }
  private var articlesSubject = BehaviorSubject<[ArticleInfo]>(value: [])

}

//MARK: - EmailedInteractorInterface

extension EmailedInteractor: EmailedInteractorInterface {

  func loadViewdArticles() {
    RequestAPI.requestArrayData(EmailedRequest()) { [weak self] articles in
      if let articles = articles?.compactMap({ ArticleInfo(model: $0) }) {
        self?.articlesSubject.onNext(articles)
      }
    }
  }
  
}

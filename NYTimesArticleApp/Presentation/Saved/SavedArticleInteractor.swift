//
//  SavedArticleInteractor.swift
//  NYTimesArticleApp
//
//  Created by Alya Filon  on 06.05.2020.
//  Copyright © 2020 AlyaFilon. All rights reserved.
//

import Foundation

protocol SavedArticleInteractorInterface: class {

  func getArticles() -> [ArticleInfo]
}

class SavedArticleInteractor {

  private let coreDataStack: CoreDataStack
  private let dataManager: DataManager

  init(coreDataStack: CoreDataStack) {
    self.coreDataStack = coreDataStack
    self.dataManager = DataManager(context: coreDataStack.context)
  }

}

//MARK: - SavedArticleInteractorInterface

extension SavedArticleInteractor: SavedArticleInteractorInterface {

  func getArticles() -> [ArticleInfo] {
    return dataManager.getArticles()
  }
}
